{ pkgs, lib, ... }:

{
  imports =
    [
      <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
      <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
    ];

  boot = {
    kernelPackages = lib.mkForce pkgs.linuxPackages_latest;
    kernelPatches = lib.singleton (import ../patches/kernel/bcachefs-support.nix);
    supportedFilesystems = lib.singleton "bcachefs";
    zfs.enableUnstable = true;
  };

  environment.systemPackages = with pkgs; [
    git
    emacs
    mkpasswd
  ];

  hardware.enableRedistributableFirmware = true;

  i18n.consoleFont = "latarcyrheb-sun32";

  isoImage = {
    includeSystemBuildDependencies = true;

    contents = [
      { source = <nixpkgs>;
        target = "nixpkgs"; }
      { source = ./..;
        target = "nixos-configuration"; }
    ];
  };

  nixpkgs.config.allowUnfree = true;
}
