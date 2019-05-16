{ lib, pkgs, ... }:

{
  imports =
    [
      ../options/pam_keyring.nix
    ];

  boot = {
    supportedFilesystems = lib.singleton "bcachefs";
    kernelPackages = lib.mkForce pkgs.linuxPackages_latest_hardened;

    kernelParams = [
      # Only perform slab/slub sanity checks
      # Slab/slub redzoning and poisoning causes I/O errors with bcachefs
      "slub_debug=F"
    ];

    kernelPatches = lib.singleton (import ../patches/kernel/bcachefs.nix);
  };
}
