{ config, lib, ... }:

with config.nixos; {
  imports =
    [
      <nixpkgs/nixos/modules/virtualisation/virtualbox-image.nix>

      ../hardware/devices
      ../hardware/profiles/intel.nix
      ../hardware/profiles/laptop.nix
      ../hardware/profiles/linux.nix
      # ../modules/xserver/window-manager/bspwm
      ../modules/xserver/window-manager/dwm
      ./desktop.nix
    ];

  nixos.settings.system.user = "vm";

  virtualbox = {
    baseImageSize = 64 * 1024;
    memorySize = 2048;
  };

  nixpkgs.config.allowUnfree = true;

  services.xserver.displayManager.lightdm.greeters = {
    enso.enable = lib.mkForce false;
    gtk.enable = lib.mkForce true;
  };

  users.users."${settings.system.user}".hashedPassword = "$6$eZVmFXSPY.7$RkJCABsQErbv/9I2Ovr1ZMw6u.DX/JpGiTXtnXU1mCkQF3fFarKKXPQ2A/Pmy.5/Y7kNIPJndpV5gqSGxmsu51";
}
