{ lib, pkgs, ... }:

{
  # imports =
  #   [
  #     <nixpkgs/nixos/modules/profiles/hardened.nix>
  #   ];

  boot.kernelPackages = lib.mkForce pkgs.rpiPackages_4_19_hardened;

  environment.memoryAllocator.provider = "libc";

  security.allowUserNamespaces = true;
  security.allowSimultaneousMultithreading = true;
}
