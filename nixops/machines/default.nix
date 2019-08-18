{ pkgs, ... }:

{
  imports = [ <nixpkgs/nixos/modules/profiles/hardened.nix> ];

  nixpkgs.system = builtins.currentSystem;

  boot.kernelPackages = pkgs.linuxPackages_latest_hardened;
  environment.memoryAllocator.provider = "libc";
  security.allowUserNamespaces = true;
  security.allowSimultaneousMultithreading = true;
}
