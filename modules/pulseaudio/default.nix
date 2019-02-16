{ pkgs, lib, ... }:

assert builtins.pathExists ./default.pa;

{
  hardware.pulseaudio = {
    configFile = ./default.pa;
    enable = true;
    extraModules = lib.singleton pkgs.pulseaudio-modules-bt;
    package = pkgs.pulseaudioFull;
    support32Bit = true;
  };
}
