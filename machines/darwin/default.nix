{ ... }:

{
  imports =
    [
      (((if (builtins.pathExists "/mnt") then "/mnt" else ""))
        + "/etc/nixos/hardware-configuration.nix")

      ../../profiles/desktop.nix

      ../../hardware/profiles/intel.nix
      ../../hardware/profiles/laptop.nix
      ../../hardware/profiles/linux.nix
      ../../hardware/profiles/uefi.nix
    ];

  environment.variables.MESA_LOADER_DRIVER_OVERRIDE = "i965";

  networking = {
    networkmanager.enable = true;
    wireless.iwd.enable = false;
  };

  nix.nixPath = [ "nixos-config=${builtins.toString ./.}" ];

  nixos.settings.system.user = "yin";

  security.allowSimultaneousMultithreading = true;

  services = {
    clight.enable = false;
    undervolt.enable = false;
  };
}
