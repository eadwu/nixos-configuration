{ config, pkgs, lib, ... }:

let
  cfg = config.services.sourcehut;
in
{
  services.sourcehut.services = [ "paste" ];
  services.nginx.virtualHosts.pastesrht = {
    addSSL = true;
    enableACME = true;

    locations."/".proxyPass = "http://${cfg.address}:${toString cfg.paste.port}";
    locations."/static".root = with cfg; "${python.out}/${python.sitePackages}/pastesrht";
  };
}
