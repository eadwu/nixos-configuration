{ config, pkgs, lib, ... }:

let
  cfg = config.services.sourcehut;
in
{
  services.sourcehut.services = lib.singleton "git";
  services.nginx.virtualHosts.gitsrht = {
    addSSL = true;
    enableACME = true;

    locations."/".proxyPass = "http://${cfg.address}:${toString cfg.git.port}";
    locations."/static".root = with cfg; "${python.out}/${python.sitePackages}/gitsrht";
    locations."= /authorize" = {
      proxyPass = "http://${cfg.address}:${toString cfg.git.port}";

      extraConfig = ''
        proxy_pass_request_body off;
        proxy_set_header Content-Length "";
        proxy_set_header X-Original-URI $request_uri;
      '';
    };

    locations."~ ^.*/(HEAD|info/refs|objects/info/.*|git-(upload|receive)-pack).*$" = {
      root = cfg.settings."git.sr.ht".repos;

      extraConfig = with config.services; ''
        auth_request /authorize;
        fastcgi_pass ${fcgiwrap.socketType}:${fcgiwrap.socketAddress};
        fastcgi_param SCRIPT_FILENAME ${pkgs.git}/libexec/git-core/git-http-backend;
        fastcgi_param PATH_INFO $uri;
        fastcgi_param GIT_PROJECT_ROOT $document_root;
        fastcgi_param GIT_HTTP_EXPORT_ALL "";
        include ${nginx.package}/conf/fastcgi_params;
        gzip off;
      '';
    };
  };
}
