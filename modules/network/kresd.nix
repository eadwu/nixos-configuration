{ pkgs, ... }:

{
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
        'hints > iterate', -- allow custom root hints
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
      -- Respect /etc/hosts
      hints.add_hosts()
      -- Prefetch learning (20-minute blocks over 24 hours)
      predict.config({ window = 20, period = 18 * (60 / 15) })

      -- Don't cache local tld
      policy.add(policy.suffix(policy.FLAGS('NO_CACHE'), { todname('local') }))
      -- Prefill root zone data
      prefill.config({
        ['.'] = {
          url = 'https://www.internic.net/domain/root.zone',
          interval = 86400, -- 1 day is roughly 86400 seconds
          ca_file = '/etc/ssl/certs/ca-certificates.crt'
        }
      })

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
