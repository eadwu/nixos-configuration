self: super:

let
  inherit (self.pkgs) stdenv fetchFromGitHub;
in {
  polybar = (super.polybar.override {
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  }).overrideAttrs (oldAttrs: {
    version = "unstable-2019-06-19";

    src = fetchFromGitHub {
      owner = "polybar";
      repo = "polybar";
      rev = "0740382851cd8bcb49004746acf2c99acdbbc385";
      sha256 = "19wnd6kcq4idj81z1zb24qp7pabc6d83x6s04bkz4nkr7a1nym6m";
      fetchSubmodules = true;
    };

    postConfigure = ''
      substituteInPlace ../include/settings.hpp.cmake \
        --replace "${stdenv.cc}" "${stdenv.cc.name}"
    '';
  });
}
