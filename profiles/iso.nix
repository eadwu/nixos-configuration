{ pkgs, lib, ... }:

{
  imports =
    [
      <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
      <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
    ];

  boot = {
    zfs.enableUnstable = true;
    supportedFilesystems = lib.singleton "bcachefs";
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
