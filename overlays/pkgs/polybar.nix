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
      rev = "152125dce94f3ace7296d4ee36df42381546711e";
      sha256 = "17qcslgd5xdcq452h00mdgg7g1163b8qi5zkfi19i0w09388n13c";
    };
  });
}
