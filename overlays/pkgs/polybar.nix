self: super:

let
  inherit (self.pkgs) stdenv fetchFromGitHub;
in {
  polybar = (super.polybar.override {
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  }).overrideAttrs (oldAttrs: {
    version = "unstable-2019-05-05";

    src = fetchFromGitHub {
      owner = "jaagr";
      repo = "polybar";
      rev = "9f7840c7d68e064cb5460a012936ac21cb8f68f2";
      sha256 = "0bla1xy2rf6iwdgc2rdyix2rfvmkhalpia56mhkysdm4szhh4nli";
      fetchSubmodules = true;
    };

    postConfigure = ''
      substituteInPlace ../include/settings.hpp.cmake \
        --replace "${stdenv.cc}" "${stdenv.cc.name}"
    '';
  });
}
