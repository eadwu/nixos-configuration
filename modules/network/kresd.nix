{ config, ... }:

{
  networking.nameservers = [ "127.0.0.1" ];

  services.kresd = {
    enable = true;
    extraConfig = ''
      modules = {
        'stats',
        'policy',
        'predict',
        'serve_stale < cache'
      }

      -- Cache size
      cache.size = 150 * MB
      -- Prefetch learning (20-minute blocks over 24 hours)
      predict.config({
        window = 20,
        period = 18 * (60 / 15)
      })

      -- Forward queries
      policy.add(policy.all(policy.TLS_FORWARD({
        { '1.1.1.1', hostname = 'cloudflare-dns.com'},
        { '1.0.0.1', hostname = 'cloudflare-dns.com'},
        -- { '2606:4700:4700::1111', hostname = 'cloudflare-dns.com'},
        -- { '2606:4700:4700::1001', hostname = 'cloudflare-dns.com'},
        { '9.9.9.9', hostname = 'dns.quad9.net'},
        { '149.112.112.112', hostname = 'dns.quad9.net'}
        -- { '2620:fe::fe', hostname = 'dns.quad9.net'},
        -- { '2620:fe::9', hostname = 'dns.quad9.net'}
      })))
    '';
  };
}
