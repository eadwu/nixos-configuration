{ lib, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix

      ../../profiles/desktop.nix

      ../../hardware/profiles/intel.nix
      ../../hardware/profiles/laptop.nix
      ../../hardware/profiles/linux.nix
      ../../hardware/profiles/uefi.nix
    ];

  networking = {
    networkmanager.enable = true;
    wireless.iwd.enable = false;
  };

  nix.nixPath = lib.singleton "nixos-config=${builtins.toString ./.}";

  nixos.settings.system.user = "yin";

  services = {
    clight.enable = false;
    undervolt.enable = false;
  };
}
