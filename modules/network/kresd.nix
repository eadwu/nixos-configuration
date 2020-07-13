{ pkgs, ... }:

{
  networking.nameservers = [ "::1" "127.0.0.1" ];

  services.kresd = {
    enable = true;
    listenPlain = [ "[::1]:53" "127.0.0.1:53" ];
    listenTLS = [ "[::1]:853" "127.0.0.1:853" ];
    extraConfig = ''
      modules = {
        'policy', -- manipulate request handling
        'prefill', -- provides ability to prefill the DNS cache
        'stats', 'predict', -- identify usage patterns and preemptively refresh expired queries
        'hints > iterate',
        'serve_stale < cache', -- allows expired entries to be served from the cache
        'workarounds < iterate' -- contains a set of hotfixes to ensure compatibility
      }

      -- Cache size
      cache.size = 1024 * MB
      -- Respect /etc/hosts
      hints.add_hosts()
      -- Enable DNSSEC validation
      trust_anchors.add_file('${pkgs.dns-root-data}/root.key', true)
      -- Prefetch learning (20-minute blocks over 24 hours)
      predict.config({ window = 20, period = 18 * (60 / 15) })

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
}
