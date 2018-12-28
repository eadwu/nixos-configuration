{ ... }:

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

      ../../options/settings.nix

      ../../profiles/desktop.nix
    ];

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
