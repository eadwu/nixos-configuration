{ pkgs, ... }:

{
  # imports =
  #   [
  #     <nixpkgs/nixos/modules/profiles/hardened.nix>
  #   ];

  boot.kernelPackages = pkgs.rpiPackages_4_19_hardened;

  boot.kernelParams = [
    "cma=32M"
    "console=tty0"
    "console=ttyS0,115200n8"

    # deadline I/O scheduler
    "elevator=deadline"
  ];

  environment.memoryAllocator.provider = "libc";

  security.allowUserNamespaces = true;
  security.allowSimultaneousMultithreading = true;
}
