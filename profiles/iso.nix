{ pkgs, lib, ... }:

{
  imports =
    [
      ./bcachefs.nix

      <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
      <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
    ];

  boot = {
    earlyVconsoleSetup = true;
    zfs.enableUnstable = true;
  };

  environment.systemPackages = with pkgs; [
    git
    emacs
    mkpasswd
  ];

  hardware.enableRedistributableFirmware = true;

  i18n = {
    consoleFont = "ter-u28n";
    consolePackages = lib.singleton pkgs.terminus_font;
  };

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
