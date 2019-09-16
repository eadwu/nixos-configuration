{ config, pkgs, lib, ... }:

let
  cfg = config.services.sourcehut;
in
{
  services.sourcehut.services = lib.singleton "man";
  services.nginx.virtualHosts.mansrht = {
    addSSL = true;
    enableACME = true;

    locations."/".proxyPass = "http://${cfg.address}:${toString cfg.man.port}";
    locations."/static".root = with cfg; "${python.out}/${python.sitePackages}/mansrht";
  };
}
