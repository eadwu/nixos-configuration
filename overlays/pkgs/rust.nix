self: super:

rec {
  rustOverlay = import "${builtins.fetchTarball {
    url = "https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz";
  }}/rust-overlay.nix" self super;

  rustPlatform = rustOverlay.latest.rustChannels.nightly // {
    inherit (super.rustPlatform) buildRustPackage;
    rustcSrc = self.pkgs.rustPlatform.rust-src;
  };
}
