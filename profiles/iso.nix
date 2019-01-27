{ pkgs, lib, ... }:

{
  imports =
    [
      <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
      <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal-new-kernel.nix>
    ];

  boot.supportedFilesystems = lib.singleton "bcachefs";

  environment.systemPackages = lib.singleton pkgs.emacs;

  hardware.enableRedistributableFirmware = true;

  i18n.consoleFont = "latarcyrheb-sun32";

  nixpkgs.config.allowUnfree = true;
}
