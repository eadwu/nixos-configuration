{ pkgs, ... }:

{
  networking.nameservers = [ "127.0.0.1" ];

  services.kresd = {
    enable = true;
    extraConfig = ''
      modules = {
        'hints',
        'stats', -- identify usage patterns and preemptively refresh expired queries
        'policy', -- manipulate request handling
        'predict', -- works together with stats
        'serve_stale < cache', -- allows expired entries to be served from the cache
        'workarounds < iterate' -- contains a set of hotfixes to ensure compatibility
      }

      -- Respect /etc/hosts
      hints.add_hosts()
      -- Cache size
      cache.size = 1024 * MB
      -- Enable DNSSEC validation
      trust_anchors.add_file('${pkgs.dns-root-data}/root.key', true)
      -- Prefetch learning (20-minute blocks over 24 hours)
      predict.config({ window = 20, period = 18 * (60 / 15) })

      -- Forward queries through Cloudflare and Quad9
      policy.add(policy.slice(
        policy.slice_randomize_psl(),
        policy.TLS_FORWARD({
          { '2606:4700:4700::1111', hostname = 'cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
          { '2606:4700:4700::1001', hostname = 'cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
          { '1.1.1.1', hostname = 'cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
          { '1.0.0.1', hostname = 'cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
        }),
        policy.TLS_FORWARD({
          { '2620:fe::fe', hostname = 'dns.quad9.net', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
          { '2620:fe::9', hostname = 'dns.quad9.net', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
          { '9.9.9.9', hostname = 'dns.quad9.net', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
          { '149.112.112.112', hostname = 'dns.quad9.net', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
        })
      ))
    '';
  };
}
