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
  };

  environment.systemPackages = with pkgs; [
    git
    emacs
    mkpasswd
  ];

  hardware.enableRedistributableFirmware = true;

  i18n.consoleFont = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";

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
