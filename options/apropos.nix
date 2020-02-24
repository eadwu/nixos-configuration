{ config, pkgs, lib, ... }:

with lib;

{
  config = mkIf config.documentation.man.enable {
    systemd.tmpfiles.rules = [ "d /var/cache/man 0755 root root -" ];

    system.activationScripts.apropos = ''
      ${pkgs.man-db}/bin/mandb
    '';
  };
}
