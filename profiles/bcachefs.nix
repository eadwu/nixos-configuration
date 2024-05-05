{ nixosModules, pkgs, lib, ... }:

{
  imports =
    [
      nixosModules.pam-keyring
    ];

  boot = {
    supportedFilesystems = [ "bcachefs" ];
    kernelPackages = lib.mkOverride 65 pkgs.linuxPackages_custom;

    kernelParams = [
      # Only perform slab/slub sanity checks
      # Slab/slub redzoning and poisoning causes I/O errors with bcachefs
      # "slub_debug=F"
    ];

    kernelPatches = [ pkgs.kernelPatches.bcachefs ];

    kernelModules = [ "chacha_generic" "poly1305_generic" ];
  };
}
