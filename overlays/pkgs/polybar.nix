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
      rev = "cc8947ac01d2725a124222416ff9b332986ea17d";
      sha256 = "1r5m2rigm7rk2jqi7daz1n8zhyxh37a7smrlwg3pb1fpy5vafvkn";
      fetchSubmodules = true;
    };
  });
}
