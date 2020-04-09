{ modulesPath, pkgs, lib, ... }:

{
  imports =
    [
      ./bcachefs.nix

      "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    ];

  boot.zfs.enableUnstable = true;

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
