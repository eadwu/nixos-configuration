self: super:

let
  inherit (self.pkgs) fetchgit python36Packages;
  inherit (python36Packages) numpy python;
in {
  blender = (super.blender.override {
    pythonPackages = python36Packages;
  }).overrideAttrs (oldAttrs: rec {
    name = "blender-2.80.beta-${version}";
    version = "141c6073ca39";

    src = fetchgit {
      url = "https://git.blender.org/blender.git";
      rev = version;
      sha256 = "0g02y05hr5vim5g6myy16c1dvx6ah8xbjd1j5jw62qd10yfg4kfp";
    };

    cmakeFlags = oldAttrs.cmakeFlags ++ [
      "-DPYTHON_NUMPY_PATH=${numpy}/${python.sitePackages}"
    ];
  });
}
