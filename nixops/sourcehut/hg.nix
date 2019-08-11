{ config, pkgs, lib, ... }:

let
  cfg = config.services.sourcehut;
in {
  services.sourcehut.services = lib.singleton "hg";
  services.nginx.virtualHosts.hgsrht = {
    addSSL = true;
    enableACME = true;

    locations."/".proxyPass = "http://${cfg.address}:${toString cfg.hg.port}";
    locations."/static".root = with cfg; "${python.out}/${python.sitePackages}/hgsrht";
    locations."= /authorize" = {
      proxyPass = "http://${cfg.address}:${toString cfg.hg.port}";

      extraConfig = ''
        proxy_pass_request_body off;
        proxy_set_header Content-Length "";
        proxy_set_header X-Original-URI $request_uri;
      '';
    };

    locations."~ ^/[~^][a-z0-9_]+/[a-zA-Z0-9_.-]+/\\.hg.*$" = {
      root = cfg.settings."hg.sr.ht".repos;

      extraConfig = with config.services; ''
        auth_request /authorize;
      '';
    };
  };
}
