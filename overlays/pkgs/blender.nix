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
    version = "2.80.2019.05.12";

    src = builtins.fetchGit {
      url = "https://git.blender.org/blender.git";
      rev = "05f1451d724874e12b3f1373e83849dbb4960ef6";
      ref = "master";
    };

    cmakeFlags = oldAttrs.cmakeFlags ++ [
      "-DPYTHON_NUMPY_PATH=${numpy}/${python.sitePackages}"
    ];
  });
}
