{ pkgs, lib, ... }:

{
  home = {
    file.".local/lib/vivaldi/libffmpeg.so".source = "${lib.getLib pkgs.vivaldi-ffmpeg-codecs}/lib/libffmpeg.so";
    packages = lib.singleton pkgs.vivaldi;
  };
}
