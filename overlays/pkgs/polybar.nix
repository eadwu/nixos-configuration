self: super:

let
  inherit (self.pkgs) stdenv fetchFromGitHub;
in {
  polybar = (super.polybar.override {
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  }).overrideAttrs (oldAttrs: {
    version = "unstable-2019-06-04";

    src = fetchFromGitHub {
      owner = "polybar";
      repo = "polybar";
      rev = "c650513b67b013aa9dd204a4df65ec5b4f11e88a";
      sha256 = "06gm1alnihgmaf8bcqsqpfk5zylimjifgj67pwamsrnwc5rj2xxa";
      fetchSubmodules = true;
    };

    postConfigure = ''
      substituteInPlace ../include/settings.hpp.cmake \
        --replace "${stdenv.cc}" "${stdenv.cc.name}"
    '';
  });
}
