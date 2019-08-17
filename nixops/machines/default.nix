{ pkgs, ... }:

{
  imports = [ <nixpkgs/nixos/modules/profiles/hardened.nix> ];

  boot.kernelPackages = pkgs.linuxPackages_latest_hardened;
  environment.memoryAllocator.provider = "libc";
  security.allowUserNamespaces = true;
  security.allowSimultaneousMultithreading = true;
}
