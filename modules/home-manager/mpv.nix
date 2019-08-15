{ pkgs, ... }:

{
  home.packages = [ pkgs.mpv ];
  xdg.configFile = {
    "mpv/config".source = ./mpv/config;
    "mpv/shaders/Anime4K_Adaptive.glsl".source = "${pkgs.anime4k.shaders}/Anime4K_Adaptive.glsl";
  };
}
