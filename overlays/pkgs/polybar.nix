self: super:

let
  inherit (self.pkgs) stdenv fetchFromGitHub;
in {
  polybar = (super.polybar.override {
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  }).overrideAttrs (oldAttrs: {
    version = "unstable-2019-06-02";

    src = fetchFromGitHub {
      owner = "polybar";
      repo = "polybar";
      rev = "5be532c51b24ea8633382c97d9a7ca5b40395d3d";
      sha256 = "1x78vkcm39015wddwbyzka94xxbkapcshaqvag9diysyykgi83jf";
      fetchSubmodules = true;
    };

    postConfigure = ''
      substituteInPlace ../include/settings.hpp.cmake \
        --replace "${stdenv.cc}" "${stdenv.cc.name}"
    '';
  });
}
