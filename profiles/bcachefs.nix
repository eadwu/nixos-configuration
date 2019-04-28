{ lib, pkgs, ... }:

{
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

  # Keyring issue for bcachefs
  # See https://github.com/NixOS/nixpkgs/issues/32279
  security.pam.defaults = ''
    session required pam_keyinit.so force revoke
  '';
}
