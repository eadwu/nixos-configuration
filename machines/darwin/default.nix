{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../hardware/webcam
      ../../hardware/profiles/intel.nix
      ../../hardware/profiles/laptop.nix
      ../../hardware/profiles/linux.nix
      ../../hardware/profiles/uefi.nix
      # ../../modules/xserver/window-manager/bspwm
      ../../modules/xserver/window-manager/dwm
      ../../profiles/desktop.nix
    ];

  services = {
    xserver = {
      libinput = {
        additionalOptions = ''
          Option "PalmDetection" "on"
          Option "TappingButtonMap" "lmr"
        '';
      };
    };
  };
}
