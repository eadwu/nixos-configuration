{ pkgs, lib, ... }:

{
  imports =
    [
      ./bcachefs.nix

      <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
      <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
    ];

  boot = {
    zfs.enableUnstable = true;
    kernelPackages = lib.mkForce pkgs.linuxPackages_latest;

    kernelPatches = lib.mkBefore [
      (import ../patches/kernel/disable-amateur-radio-support.nix)
    ];
  };

  console = {
    earlySetup = true;
    font = "ter-u28n";
    packages = [ pkgs.terminus_font ];
  };

  environment = {
    memoryAllocator.provider = "libc";

    systemPackages = with pkgs; [
      git
      emacs
      mkpasswd
    ];
  };

  hardware.enableRedistributableFirmware = true;

  isoImage = {
    includeSystemBuildDependencies = true;

    contents = [
      {
        source = <nixpkgs>;
        target = "nixpkgs";
      }
      {
        source = ./..;
        target = "nixos-configuration";
      }
    ];
  };

  nixpkgs.config.allowUnfree = true;
}
