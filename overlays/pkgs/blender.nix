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
    version = "2.80-beta";

    src = builtins.fetchGit {
      url = "https://git.blender.org/blender.git";
    };

    cmakeFlags = oldAttrs.cmakeFlags ++ [
      "-DPYTHON_NUMPY_PATH=${numpy}/${python.sitePackages}"
    ];
  });
}
