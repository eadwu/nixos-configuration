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
    version = "2.80-rc3";

    src = builtins.fetchGit {
      url = "https://git.blender.org/blender.git";
      rev = "507ffee6e1f4a2b2795c7c93cd3f37f4df748ee9";
      ref = "blender-v2.80-release";
    };

    cmakeFlags = oldAttrs.cmakeFlags ++ [
      "-DPYTHON_NUMPY_PATH=${numpy}/${python.sitePackages}"
    ];
  });
}
