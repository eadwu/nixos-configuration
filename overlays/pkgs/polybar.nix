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
      rev = "bf0b6635498c3a315c6c72057c7f331828657ae2";
      sha256 = "1c4pwjd318l611s0l0f0gfdjppfk0c08nyrl9yk79bs7792bdp9s";
      fetchSubmodules = true;
    };
  });
}
