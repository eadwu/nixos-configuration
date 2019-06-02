{ pkgs, lib, ... }:

{
  home.packages = lib.singleton pkgs.mpv;
  xdg.configFile."mpv/config".source = ./mpv/config;
}
