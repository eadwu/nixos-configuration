{ pkgs, lib, ... }:

let
  widevine = with pkgs; let
    version = "4.10.1196.0";

    arch = {
      "i686-linux" = "ia32";
      "x86_64-linux" = "x64";
      "x86_64-darwin" = "x64";
    }."${stdenv.hostPlatform.system}";
  in runCommand "widevine-${version}" {
    src = fetchurl {
      url = "https://dl.google.com/widevine-cdm/${version}-linux-${arch}.zip";
      sha256 = "01c7nr7d2xs718jymicbk4ipzfx6q253109qv3lk4lryrrhvw14y";
    };

    buildInputs = [ unzip ];
  } ''
    unzip $src
    mkdir -p $out/lib
    mv libwidevinecdm.so $out/lib
  '';
in {
  home = {
    packages = lib.singleton pkgs.vivaldi;

    file = {
      ".local/lib/vivaldi/libffmpeg.so".source = "${lib.getLib pkgs.vivaldi-ffmpeg-codecs}/lib/libffmpeg.so";
      ".local/lib/vivaldi/libwidevinecdm.so".source = "${lib.getLib widevine}/lib/libwidevinecdm.so";
      ".local/lib/vivaldi-snapshot/libffmpeg.so".source = "${lib.getLib pkgs.vivaldi-ffmpeg-codecs}/lib/libffmpeg.so";
      ".local/lib/vivaldi-snapshot/libwidevinecdm.so".source = "${lib.getLib widevine}/lib/libwidevinecdm.so";
    };
  };
}
