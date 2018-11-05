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
      rev = "07d35df538b7b016997d1c7fe9995bf038901dbd";
      sha256 = "0c6w51lk62bd3n37m02vb8hkmvqrwbi2yg01p1f9mnjgwda24j8j";
    };
  });
}
