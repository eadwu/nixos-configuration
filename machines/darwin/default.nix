{ lib, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix

      ../../hardware/webcam
      ../../hardware/profiles/intel.nix
      ../../hardware/profiles/laptop.nix
      ../../hardware/profiles/linux.nix
      ../../hardware/profiles/uefi.nix

      # ../../modules/xserver/window-manager/bspwm
      ../../modules/xserver/window-manager/dwm

      ../../options/settings.nix

      ../../profiles/desktop.nix
    ];

  networking = {
    networkmanager = {
      enable = true;
    };

    wireless = {
      iwd = {
        enable = lib.mkForce false;
      };
    };
  };

  nixos = {
    custom = {
      settings = {
        system = {
          user = "yin";
        };
      };
    };
  };

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
