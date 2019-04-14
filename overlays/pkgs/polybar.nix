self: super:

let
  inherit (self.pkgs) stdenv fetchFromGitHub;
in {
  polybar = (super.polybar.override {
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  }).overrideAttrs (oldAttrs: {
    version = "unstable-2019-04-08";

    src = fetchFromGitHub {
      owner = "jaagr";
      repo = "polybar";
      rev = "d5112c9b663a3c0d8b013f5110bbf448c18c1ffd";
      sha256 = "097m9zckp3sw340jbpz27yxkls9c3j8d85s5b37h8m96fnixmnjn";
      fetchSubmodules = true;
    };

    postConfigure = ''
      substituteInPlace ../include/settings.hpp.cmake \
        --replace "${stdenv.cc}" "${stdenv.cc.name}"
    '';
  });
}
