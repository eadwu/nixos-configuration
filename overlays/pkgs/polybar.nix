self: super:

let
  inherit (self.pkgs) fetchFromGitHub;
in {
  polybar = (super.polybar.override {
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  }).overrideAttrs (oldAttrs: {
    src = fetchFromGitHub {
      owner = "jaagr";
      repo = "polybar";
      rev = "46b8bb84edce683e75672b2c0c9ff58cfb3f9f68";
      sha256 = "1p0i93hgq7gc7bx593hv9c0njpww1m2paphyqgh84lnmkzwmjfbx";
      fetchSubmodules = true;
    };
  });
}
