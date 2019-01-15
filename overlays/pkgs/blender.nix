self: super:

let
  inherit (self.pkgs) fetchgit python36Packages;
  inherit (python36Packages) numpy python;
in {
  blender = (super.blender.override {
    pythonPackages = python36Packages;
  }).overrideAttrs (oldAttrs: rec {
    name = "blender-2.80.beta-${version}";
    version = "b5b6555768a3";

    src = fetchgit {
      url = "https://git.blender.org/blender.git";
      rev = version;
      sha256 = "0flydqhblfwv2wj1a17zq8jl8qn28cnnpram9hpkw6vgx16fk1y0";
    };

    cmakeFlags = oldAttrs.cmakeFlags ++ [
      "-DPYTHON_NUMPY_PATH=${numpy}/${python.sitePackages}"
    ];
  });
}
