{ pkgs, ... }:

{
  home.packages = [ pkgs.mpv ];
  xdg.configFile."mpv/config".source = ./mpv/config;
}
