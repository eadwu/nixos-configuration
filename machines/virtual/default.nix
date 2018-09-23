{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../hardware/webcam
      ../../hardware/profiles/intel.nix
      ../../hardware/profiles/laptop.nix
      ../../hardware/profiles/linux.nix
      # ../../modules/xserver/window-manager/bspwm
      ../../modules/xserver/window-manager/dwm
      ../../profiles/desktop.nix
    ];

  boot = {
    kernelPackages = lib.mkForce pkgs.linuxPackages_latest;

    loader = {
      grub = {
        enable = true;
        device = "/dev/sda";
        version = 2;
      };
    };
  };
}
