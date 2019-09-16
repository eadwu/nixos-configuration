{ config, pkgs, lib, ... }:

let
  cfg = config.services.sourcehut;
in
{
  services.sourcehut.services = lib.singleton "todo";
  services.nginx.virtualHosts.todosrht = {
    addSSL = true;
    enableACME = true;

    locations."/".proxyPass = "http://${cfg.address}:${toString cfg.todo.port}";
    locations."/static".root = with cfg; "${python.out}/${python.sitePackages}/todosrht";
  };
}
