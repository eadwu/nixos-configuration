self: super:

{
  rustPlatform = (import "${builtins.fetchGit {
    url = "https://github.com/mozilla/nixpkgs-mozilla";
  }}/rust-overlay.nix" self super).rustChannelOf { date = "2019-06-09"; channel = "nightly"; } // {
    inherit (super.rustPlatform) buildRustPackage recurseForDerivations;
    rustcSrc = self.pkgs.rustPlatform.rust-src;
  };
}
