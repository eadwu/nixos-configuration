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
      rev = "bc9eddfcae2fbadea55b37137b278af75c1d3814";
      sha256 = "1fp0yqzzyk4d6qamabkd428aj8ddwz31dv8a12bznc11rgvw6520";
      fetchSubmodules = true;
    };
  });
}
