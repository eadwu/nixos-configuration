self: super:

let
  mesa_noglu = (import (builtins.fetchGit {
    url = <nixpkgs>;
    ref = "mesa/build-with-meson";
  }) { }).mesa_noglu.overrideAttrs (oldAttrs: {
    version = "19.1.0-devel";

    src = builtins.fetchGit {
      url = "https://gitlab.freedesktop.org/mesa/mesa.git";
      rev = "32ffd90002b04bff20a587e5d2f31fe79af1a4f2";
    };

    patches = with self.pkgs.lib; filter (patch: !(isDerivation patch)) oldAttrs.patches;
  });
in {
  mesa_drivers = (mesa_noglu.override {
    galliumDrivers = [ "virgl" "svga" "iris" "r300" "r600" "radeonsi" "nouveau" ];
  }).drivers;
}
