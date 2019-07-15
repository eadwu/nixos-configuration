self: super:

{
  rustPlatform = (import "${builtins.fetchGit {
    url = "https://github.com/mozilla/nixpkgs-mozilla";
  }}/rust-overlay.nix" self super).rustChannelOf { date = "2019-07-15"; channel = "nightly"; } // {
    inherit (super.rustPlatform) buildRustPackage;
    rustcSrc = self.pkgs.rustPlatform.rust-src;
  };
}
