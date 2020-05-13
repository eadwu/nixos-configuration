{ pkgs, ... }:

{
  hardware.pulseaudio = {
    enable = true;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
    package = pkgs.pulseaudioFull;

    tcp = {
      enable = true;
      anonymousClients.allowedIpRanges = [ "127.0.0.1" ];
    };

    extraConfig = ''
      ### Automatically switch to newly-connected devices
      load-module module-switch-on-connect
    '';
  };
}
