self: super:

let
  inherit (self.pkgs) fetchgit fetchpatch;
in {
  polybar = (super.polybar.override {
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  }).overrideAttrs (oldAttrs: {
    src = fetchgit {
      url = "https://github.com/jaagr/polybar";
      rev = "a2ab4699abf5c13c6121cc0e2b7a13225eb24f6a";
      sha256 = "1y3f1ysrayy7sg5pkbckilkvc1z99qh0mz5kckf98krq852s75il";
    };
  });
}
