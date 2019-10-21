self: super:

{
  rustPlatform = (
    import "${builtins.fetchTarball {
      url = "https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz";
    }}/rust-overlay.nix" self super
  ).rustChannelOf { date = "2019-10-20"; channel = "nightly"; } // {
    inherit (super.rustPlatform) buildRustPackage;
    rustcSrc = self.pkgs.rustPlatform.rust-src;
  };
}
