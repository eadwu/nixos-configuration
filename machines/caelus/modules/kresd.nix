{ config, pkgs, lib, ... }:

/*
https://oisd.nl/downloads
https://github.com/yokoffing/NextDNS-Config
https://o0.pages.dev
*/

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
  # environment.etc."resolv.conf".source = lib.mkForce (pkgs.writeText "resolv.conf" ''
  #   ${lib.concatMapStringsSep "\n" (ns: "nameserver ${ns}") config.networking.nameservers}
  # '');

  environment.etc."kresd/hosts.rpz".source = hosts-rpz;

  # networking.nameservers = [];
  # networking.nameservers = [ "::1" "127.0.0.1" ];

  # services.influxdb = {
  #   enable = true;
  #   extraConfig.graphite = [{
  #     enabled = true;
  #     protocol = "tcp";
  #     database = "graphite";
  #     bind-address = ":2003";
  #     templates = [ "host.measurement*" ];
  #   }];
  # };

  # services.grafana.provision.datasources = [{
  #   name = "knot-resolver";
  #   type = "influxdb";
  #   url = "http://localhost:8086";

  #   database = "graphite";
  #   user = "influxdb";
  # }];

  # systemd.services."kresd@".after = [ "influxdb.service" ];
  services.kresd = {
    enable = true;
    listenPlain = [ "[::1]:53" "127.0.0.1:53" ];
    listenTLS = [ "[::1]:853" "127.0.0.1:853" ];
    extraConfig = ''
      -- net.listen({'::1', '127.0.0.1'}, 8453, { kind = 'webmgmt', freebind = true })

      -- Get instance identifier - in this case from systemd from kresd@{ID}
      local systemd_instance = os.getenv("SYSTEMD_INSTANCE")
      modules.load('nsid')
      nsid.name(systemd_instance)

      modules = {
        'http', -- HTTP module with defaults (self-signed TLS cert)
        'policy', -- manipulate request handling
        'prefill', -- provides ability to prefill the DNS cache
        'stats', -- Track internal statistics
        'hints > iterate', -- Allow loading /etc/hosts or custom root hints
        'predict', -- identify usage patterns and preemptively refresh expired queries
        'serve_stale < cache', -- allows expired entries to be served from the cache

        -- stats collection using Graphite over InfluxDB
        graphite = {
          host = { '::1', '127.0.0.1' },
          port = 2003,
          -- send over TCP
          tcp = true,
          -- optional metric prefix
          prefix = 'kresd' .. '.' .. hostname() .. '.' .. nsid.name(),
          -- publish interval
          interval = 1 * sec,
        },
      }

      -- Force requestor to use TCP.
      -- It sets truncated bit (TC) in response to true if the request came through UDP,
      --   which will force standard-compliant clients to retry the request over TCP.
      -- policy.add(policy.all(policy.TC))

      -- Cache size
      cache.size = 128 * MB

      -- Prefetch learning (20-minute blocks over 24 hours)
      -- Drop due to use on WSL, might be causing more problems than expected ...
      predict.config({ window = 20, period = 18 * (60 / 15) })

      -- Use local root server copy for performance reasons (root hints are included on NixOS via command line)
      -- hints.root({
      --   ['j.root-servers.net.'] = { '192.168.1.4', '2001:503:c27::2:30', '192.58.128.30' }
      -- })

      -- Speed monitor
      local ffi = require('ffi')

      -- log statistics every second
      local stat_id = event.recurrent(1 * second, function(evid)
          log_info(ffi.C.LOG_GRP_STATISTICS, table_print(stats.list()))
      end)

      -- stop printing statistics after first minute
      event.after(1 * minute, function(evid)
              event.cancel(stat_id)
      end)

      -- speed_monitor definition
      -- prints warning if more than 5% of total answers was slow
      function speed_monitor()
              local previous = stats.list()   -- store statistics in persistent variable
              return function(evid)
                      local now = stats.list()    -- save actual statistics to variable
                      -- number of total answers between 'now' and 'previous' states
                      local total_increment = now['answer.total'] - previous['answer.total']
                      -- number of slow answers between 'now' and 'previous' states
                      local slow_increment = now['answer.slow'] - previous['answer.slow']
                      -- if percentage of slow answers is bigger than 5%, print warning
                      if slow_increment / total_increment > 0.05 then
                              log_warn(ffi.C.LOG_GRP_STATISTICS, 'WARNING! More than 5 %% of queries was slow!')
                      end
                      previous = now
              end
      end

      -- execute speed_monitor every minute
      local monitor_id = event.recurrent(1 * minute, speed_monitor())

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
      prefill_root()

      -- If /etc/hosts is too big, hints.add_hosts() fails and causes resource issues, so it's recommended to use `policy.rpz`
      -- If every program respect nsswitch this wouldn't be a problem but some don't
      -- So we convert /etc/hosts into it's RPZ equivalent and watch for changes to keep them in sync
      -- We don't need to keep the file in sync because it's generated through a Nix derivation
      -- https://wiki.archlinux.org/index.php/Domain_name_resolution
      local load_rpz = coroutine.wrap(function ()
        -- Pretty-print DNS responses from upstream servers (or cache) into logs
        policy.add(policy.rpz(policy.DEBUG_ALWAYS, '${hosts-rpz}', false))
        policy.add(policy.rpz(policy.QTRACE, '${hosts-rpz}', false))
        -- policy.add(policy.rpz(policy.REQTRACE, '${hosts-rpz}', false))
        -- policy.add(policy.rpz(policy.IPTRACE, '${hosts-rpz}', false))

        -- Terminate query resolution and return REFUSED to the requestor.
        -- policy.add(policy.rpz(policy.REFUSE, '${hosts-rpz}', false))

        -- Deny existence of names matching filter, i.e. reply NXDOMAIN authoritatively.
        -- policy.add(policy.rpz(policy.DENY, '${hosts-rpz}', false))
      end)
      load_rpz()

      --[[
      -- Forward queries through Cloudflare
      policy.add(policy.TLS_FORWARD({
        { '2606:4700:4700::1113', hostname = 'family.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
        { '2606:4700:4700::1003', hostname = 'family.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
        { '1.1.1.3', hostname = 'family.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
        { '1.0.0.3', hostname = 'family.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
      }))
      --]]

      -- Forward queries through Cloudflare and Quad9
      policy.add(policy.slice(
        policy.slice_randomize_psl(),
        -- Block malware and adult content
        policy.TLS_FORWARD({
          { '2606:4700:4700::1113', hostname = 'family.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
          { '1.1.1.3', hostname = 'family.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
        }),
        policy.TLS_FORWARD({
          { '2606:4700:4700::1003', hostname = 'family.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
          { '1.0.0.3', hostname = 'family.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
        })
        --[[
        -- Block malware
        policy.TLS_FORWARD({
          { '2606:4700:4700::1112', hostname = 'security.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
          { '1.1.1.2', hostname = 'security.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
        }),
        policy.TLS_FORWARD({
          { '2606:4700:4700::1002', hostname = 'security.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
          { '1.0.0.2', hostname = 'security.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
        }),
        -- No DNS server filter
        policy.TLS_FORWARD({
          { '2606:4700:4700::1111', hostname = 'cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
          { '1.1.1.1', hostname = 'cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
        }),
        policy.TLS_FORWARD({
          { '2606:4700:4700::1001', hostname = 'cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
          { '1.0.0.1', hostname = 'cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
        }),
        policy.TLS_FORWARD({
          { '2620:fe::fe', hostname = 'dns.quad9.net', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
          { '9.9.9.9', hostname = 'dns.quad9.net', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
        }),
        policy.TLS_FORWARD({
          { '2620:fe::9', hostname = 'dns.quad9.net', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
          { '149.112.112.112', hostname = 'dns.quad9.net', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
        })
        --]]
      ))
    '';
  };

  # services.prometheus.scrapeConfigs = [
  #   ({
  #     job_name = "kresd";
  #     honor_labels = true;
  #     static_configs = [ { targets = [ "localhost:8453" ]; } ];
  #   })
  # ];
}
