{ pkgs, ... }:

assert builtins.pathExists ./default.pa;

{
  hardware.pulseaudio = {
    configFile = ./default.pa;
    enable = true;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
    package = pkgs.pulseaudioFull;

    tcp = {
      enable = true;
      anonymousClients.allowedIpRanges = [ "127.0.0.1" "192.168.1.0/24" ];
    };
  };
}
