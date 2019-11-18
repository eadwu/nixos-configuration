{ pkgs, ... }:

let
  anime4k = pkgs.fetchzip {
    url = "https://github.com/bloc97/Anime4K/releases/download/v1.0-RC2/Anime4K_GLSL_v1.0RC2.zip";
    sha256 = "0hdyzd1qbd0p28kq2a9rfgmpdzgba40dwvl01dccb47zclgx0xq5";
    stripRoot = false;
  };
in {
  home.packages = [ pkgs.mpv ];
  xdg.configFile = {
    "mpv/config".source = ./mpv/config;
    "mpv/shaders/Anime4K_Adaptive.glsl".source = "${anime4k}/Anime4K_Adaptive_v1.0RC2.glsl";
  };
}
