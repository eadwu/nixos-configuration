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
      rev = "35c0c4a3437fe88cad44112fc642082ea72ce299";
      sha256 = "17cfmw2qbjp8zkbp7f23mp5k3vhw4xpfkk07icyxpgw5ih7cif1z";
      fetchSubmodules = true;
    };
  });
}
