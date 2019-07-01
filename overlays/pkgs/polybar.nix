self: super:

let
  inherit (self.pkgs) stdenv fetchFromGitHub;
in {
  polybar = (super.polybar.override {
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  }).overrideAttrs (oldAttrs: {
    version = "unstable-2019-07-01";

    src = fetchFromGitHub {
      owner = "polybar";
      repo = "polybar";
      rev = "f0c65e6cf08012d10bde88b2caee39ad938b40fe";
      sha256 = "053bxzymhr4h22xmm8g6hrqbyp89qjy8ch4nrai681a2w0a1pmzh";
      fetchSubmodules = true;
    };

    postConfigure = ''
      substituteInPlace ../include/settings.hpp.cmake \
        --replace "${stdenv.cc}" "${stdenv.cc.name}"
    '';
  });
}
