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

  nix.nixPath = lib.singleton "nixos-config=${builtins.toString ./.}";

  nixpkgs.overlays = lib.singleton (self: super: {
    mesa_drivers = super.mesa.drivers;
  });

  nixos.settings.system.user = "yin";

  services.undervolt.enable = false;
}
