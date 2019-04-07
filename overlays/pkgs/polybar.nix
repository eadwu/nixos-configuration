self: super:

let
  inherit (self.pkgs) stdenv fetchFromGitHub;
in {
  polybar = (super.polybar.override {
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  }).overrideAttrs (oldAttrs: rec {
    name = "${pname}-${version}";
    pname = stdenv.lib.removeSuffix "-${oldAttrs.version}" oldAttrs.name;
    version = "unstable-2019-04-07";

    src = fetchFromGitHub {
      owner = "jaagr";
      repo = "polybar";
      rev = "7414e9800879cc3692af5ca217fdb18978ba8b4a";
      sha256 = "1qa3ik8cc5a573myplsarpb9ah4k5vm4ybc78gzfm5fj4ad9dbaw";
      fetchSubmodules = true;
    };

    postConfigure = ''
      substituteInPlace ../include/settings.hpp.cmake \
        --replace "${stdenv.cc}" "${stdenv.cc.name}"
    '';
  });
}
