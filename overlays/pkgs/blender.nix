self: super:

let
  inherit (self.pkgs) fetchgit python36Packages;
  inherit (python36Packages) numpy python;
in {
  blender = (super.blender.override {
    pythonPackages = python36Packages;
  }).overrideAttrs (oldAttrs: rec {
    name = "blender-2.80.beta-${version}";
    version = "690478027bd7";

    src = fetchgit {
      url = "https://git.blender.org/blender.git";
      rev = version;
      sha256 = "0zdlad8bhalmvpy441isr3kgm53jz9lacjk25ap9rgqy8pk38a67";
    };

    cmakeFlags = oldAttrs.cmakeFlags ++ [
      "-DPYTHON_NUMPY_PATH=${numpy}/${python.sitePackages}"
    ];
  });
}
