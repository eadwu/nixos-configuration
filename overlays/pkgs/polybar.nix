self: super:

let
  inherit (self.pkgs) stdenv fetchFromGitHub;
in {
  polybar = (super.polybar.override {
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  }).overrideAttrs (oldAttrs: {
    version = "unstable-2019-05-17";

    src = fetchFromGitHub {
      owner = "polybar";
      repo = "polybar";
      rev = "7724c4dccb18ed9e48b050713540a2d05eacd2a1";
      sha256 = "1f2ap76hk6ldlg3980kfh2lr9ks7sy31pg8q0fsbx9zmwg7aphif";
      fetchSubmodules = true;
    };

    postConfigure = ''
      substituteInPlace ../include/settings.hpp.cmake \
        --replace "${stdenv.cc}" "${stdenv.cc.name}"
    '';
  });
}
