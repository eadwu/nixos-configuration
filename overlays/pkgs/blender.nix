self: super:

let
  inherit (self.pkgs) python37Packages;
  inherit (python37Packages) numpy python;
in {
  blender = (super.blender.override {
    pythonPackages = python37Packages;
  }).overrideAttrs (oldAttrs: rec {
    name = "${pname}-${version}";
    pname = "blender";
    version = "2.80.2019.04.14";

    src = builtins.fetchGit {
      url = "https://git.blender.org/blender.git";
      rev = "14884cda1ff5677cacff7a038efa5440f5e15a5c";
      ref = "master";
    };

    cmakeFlags = oldAttrs.cmakeFlags ++ [
      "-DPYTHON_NUMPY_PATH=${numpy}/${python.sitePackages}"
    ];
  });
}
