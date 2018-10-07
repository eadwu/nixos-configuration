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
      rev = "13b0ee74544bd52fd2b1c7fd9361964005e5b7eb";
      sha256 = "0l0m0d3znr8zf6q6zbfklvrsgznmqzqrg5j17ynpcv2h3cfl15ki";
    };
  });
}
