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
      rev = "abdd5f9233bebd2c6a0fbe310ed8a0f4f5f36981";
      sha256 = "0rpjpg5p8ybr8vlcagxiy35pcy5pq18c2ynqcsx327v0n6msjfrn";
    };
  });
}
