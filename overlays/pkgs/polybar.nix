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
      rev = "f8e4a5932a65a6f6595e8580295ff1e4132232f7";
      sha256 = "1fn55j6mpjigq1q47763r251qq3m7551b02f4ygvz78566h7iagx";
      fetchSubmodules = true;
    };
  });
}
