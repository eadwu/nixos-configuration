self: super:

let
  inherit (self.pkgs) fetchgit python36Packages;
  inherit (python36Packages) numpy python;
in {
  blender = (super.blender.override {
    pythonPackages = python36Packages;
  }).overrideAttrs (oldAttrs: rec {
    name = "blender-2.80.beta-${version}";
    version = "7467049055a7";

    src = fetchgit {
      url = "https://git.blender.org/blender.git";
      rev = version;
      sha256 = "1qh29d3clgbpbxd72lhd563np7mgafavpb7pnc6dlsayq577k4ij";
    };

    cmakeFlags = oldAttrs.cmakeFlags ++ [
      "-DPYTHON_NUMPY_PATH=${numpy}/${python.sitePackages}"
    ];
  });
}
