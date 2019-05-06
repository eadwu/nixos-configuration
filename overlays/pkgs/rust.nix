self: super:

{
  rustPlatform = (import "${builtins.fetchGit {
    url = "https://github.com/mozilla/nixpkgs-mozilla";
  }}/rust-overlay.nix" self super).rustChannelOf { date = "2019-05-05"; channel = "nightly"; } // {
    inherit (super.rustPlatform) buildRustPackage recurseForDerivations;
    rustcSrc = self.pkgs.rustPlatform.rust-src;
  };
}
