{ config, pkgs, lib, ... }:

let
  cfg = config.services.sourcehut;
in {
  services.sourcehut.services = lib.singleton "meta";
  services.nginx.virtualHosts.metasrht = {
    addSSL = true;
    enableACME = true;

    locations."/".proxyPass = "http://${cfg.address}:${toString cfg.meta.port}";
    locations."/static".root = with cfg; "${python.out}/${python.sitePackages}/metasrht";
  };

  services.sourcehut.settings = {
    # In college I'll probably need some, cough, discreet users, admins have unlimited invites
    "meta.sr.ht::settings".user-invites = 0;
    "meta.sr.ht::settings".onboarding-redirect = cfg.settings."meta.sr.ht".origin;
  };
}
