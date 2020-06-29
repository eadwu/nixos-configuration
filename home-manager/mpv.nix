{ pkgs, ... }:

let
  anime4k = pkgs.fetchzip {
    url = "https://github.com/bloc97/Anime4K/releases/download/3.1/Anime4K_v3.1.zip";
    sha256 = "11j1x40kfigr76d2a97pp3q78pz6b2vxfmic40zdq0zrwdwxzgbg";
    stripRoot = false;
  };
in
{
  home.packages = [ pkgs.mpv ];
  xdg.configFile."mpv/config".source = pkgs.substituteAll {
    src = ./mpv/config;
    inherit anime4k;
  };
}
