{ pkgs, ... }:

assert builtins.pathExists ./default.pa;

{
  hardware.pulseaudio = {
    configFile = ./default.pa;
    enable = true;
    package = pkgs.pulseaudioFull;
    support32Bit = true;
  };
}
