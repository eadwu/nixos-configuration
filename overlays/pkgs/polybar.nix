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
      rev = "d3e37918e50f3addda964da53575b039656efb8c";
      sha256 = "1gfn2c93vsi92imr1gjz7amzri2al6ldvnhka8k5dmvgkny6ydbh";
      fetchSubmodules = true;
    };
  });
}
