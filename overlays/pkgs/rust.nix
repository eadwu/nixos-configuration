self: super:

{
  rustPlatform = (import "${builtins.fetchGit {
    url = "https://github.com/mozilla/nixpkgs-mozilla";
  }}/rust-overlay.nix" self super).rustChannelOf { date = "2019-03-23"; channel = "nightly"; } // {
    inherit (super.rustPlatform) buildRustPackage recurseForDerivations;
    rustcSrc = self.pkgs.rustPlatform.rust-src;
  };
}
