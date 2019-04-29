self: super:

let
  inherit (self.pkgs) stdenv fetchFromGitHub;
in {
  polybar = (super.polybar.override {
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  }).overrideAttrs (oldAttrs: {
    version = "unstable-2019-04-24";

    src = fetchFromGitHub {
      owner = "jaagr";
      repo = "polybar";
      rev = "f1061e1217ea25d43a015e9c2069dbd7cb2fe8a2";
      sha256 = "1b465ahxwkn58x8311n158wx7d5s44qn2pjvsnpcf6fdzfv231wm";
      fetchSubmodules = true;
    };

    postConfigure = ''
      substituteInPlace ../include/settings.hpp.cmake \
        --replace "${stdenv.cc}" "${stdenv.cc.name}"
    '';
  });
}
