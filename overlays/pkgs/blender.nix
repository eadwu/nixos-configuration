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
    version = "2.80.2019.06.02";

    src = builtins.fetchGit {
      url = "https://git.blender.org/blender.git";
      rev = "19dcb22a885d637a08e2c459aa47e855dc5114f3";
      ref = "master";
    };

    cmakeFlags = oldAttrs.cmakeFlags ++ [
      "-DPYTHON_NUMPY_PATH=${numpy}/${python.sitePackages}"
    ];
  });
}
