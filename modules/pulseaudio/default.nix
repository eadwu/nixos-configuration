{ pkgs, ... }:

assert builtins.pathExists ./default.pa;

{
  hardware.pulseaudio = {
    configFile = ./default.pa;
    enable = true;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
    package = pkgs.pulseaudioFull;
  };
}
