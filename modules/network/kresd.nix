{ config, pkgs, lib, ... }:

let
  hosts-rpz = pkgs.runCommand "etc-hosts-rpz" {
    src = config.environment.etc.hosts.source;
    nativeBuildInputs = with pkgs; [ perl gawk gnused gnugrep coreutils ];
  } ''
    grep . $src | grep -v '^#' | awk '{print $2}' | \
      perl -pe 's/\r\n$/\n/g' | sort | uniq | \
      sed 's/$/\tCNAME\t./' > $out
  '';
in
{
  # Thou who art mine, override all who are present
  environment.etc."resolv.conf".source = lib.mkForce (pkgs.writeText "resolv.conf" ''
    ${lib.concatMapStringsSep "\n" (ns: "nameserver ${ns}") config.networking.nameservers}
  '');

  networking.nameservers = [ "::1" "127.0.0.1" ];

  services.influxdb = {
    enable = true;
    extraConfig.graphite = [{
      enabled = true;
      protocol = "tcp";
      database = "graphite";
      bind-address = ":2003";
      templates = [ "host.measurement*" ];
    }];
  };

  services.grafana.provision.datasources = [{
    name = "knot-resolver";
    type = "influxdb";
    url = "http://localhost:8086";

    database = "graphite";
    user = "influxdb";
  }];

  systemd.services."kresd@".after = [ "influxdb.service" ];
  services.kresd = {
    enable = true;
    listenPlain = [ "[::1]:53" "127.0.0.1:53" ];
    listenTLS = [ "[::1]:853" "127.0.0.1:853" ];
    extraConfig = ''
      net.listen({'::1', '127.0.0.1'}, 8453, { kind = 'webmgmt', freebind = true })

      modules = {
        'http', -- HTTP module with defaults (self-signed TLS cert)
        'policy', -- manipulate request handling
        'prefill', -- provides ability to prefill the DNS cache
        'stats', 'predict', -- identify usage patterns and preemptively refresh expired queries
        'serve_stale < cache', -- allows expired entries to be served from the cache
        'workarounds < iterate', -- contains a set of hotfixes to ensure compatibility

        -- stats collection using Graphite over InfluxDB
        graphite = {
          host = { '::1', '127.0.0.1' },
          port = 2003,
          -- send over TCP
          tcp = true,
          -- optional metric prefix
          prefix = hostname(),
          -- publish interval
          interval = 1 * sec,
        },
      }

      -- Cache size
      cache.size = 1024 * MB
      -- Prefetch learning (20-minute blocks over 24 hours)
      predict.config({ window = 20, period = 18 * (60 / 15) })

      -- Don't cache local tld
      policy.add(policy.suffix(policy.FLAGS('NO_CACHE'), { todname('local') }))
      -- Prefill root zone data
      local prefill_root = coroutine.wrap(function ()
        prefill.config({
          ['.'] = {
            url = 'https://www.internic.net/domain/root.zone',
            interval = 86400, -- 1 day is roughly 86400 seconds
            ca_file = '/etc/ssl/certs/ca-certificates.crt'
          }
        })
      end)

      -- If /etc/hosts is too big, hints.add_hosts() fails and causes resource issues, so it's recommended to use `policy.rpz`
      -- If every program respect nsswitch this wouldn't be a problem but some don't
      -- So we convert /etc/hosts into it's RPZ equivalent and watch for changes to keep them in sync
      -- We don't need to keep the file in sync because it's generated through a Nix derivation
      -- https://wiki.archlinux.org/index.php/Domain_name_resolution
      local load_rpz = coroutine.wrap(function ()
        policy.add(policy.rpz(policy.DENY, '${hosts-rpz}', false))
      end)

      -- Forward queries through Cloudflare and Quad9
      policy.add(policy.slice(
        policy.slice_randomize_psl(),
        policy.TLS_FORWARD({
          { '2620:fe::fe', hostname = 'dns.quad9.net', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
          { '9.9.9.9', hostname = 'dns.quad9.net', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
        }),
        policy.TLS_FORWARD({
          { '2620:fe::9', hostname = 'dns.quad9.net', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
          { '149.112.112.112', hostname = 'dns.quad9.net', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
        }),
        policy.TLS_FORWARD({
          { '2606:4700:4700::1111', hostname = 'cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
          { '1.1.1.1', hostname = 'cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
        }),
        policy.TLS_FORWARD({
          { '2606:4700:4700::1001', hostname = 'cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
          { '1.0.0.1', hostname = 'cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
        })
      ))

      -- Start offloaded coroutines
      load_rpz()
      prefill_root()
    '';
  };

  services.prometheus.scrapeConfigs = [
    ({
      job_name = "kresd";
      honor_labels = true;
      static_configs = [ { targets = [ "localhost:8453" ]; } ];
    })
  ];
}
