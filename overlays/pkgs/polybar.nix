self: super:

let
  inherit (self.pkgs) stdenv fetchFromGitHub;
in {
  polybar = (super.polybar.override {
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  }).overrideAttrs (oldAttrs: {
    version = "unstable-2019-05-10";

    src = fetchFromGitHub {
      owner = "polybar";
      repo = "polybar";
      rev = "65e72fd71ef207f0236a8fac2e1e10eccba56e08";
      sha256 = "03zjvixmbnibb94vyklaa7y0cjm54p59c6chklwqfsy0448l7ibz";
      fetchSubmodules = true;
    };

    postConfigure = ''
      substituteInPlace ../include/settings.hpp.cmake \
        --replace "${stdenv.cc}" "${stdenv.cc.name}"
    '';
  });
}
