{ config, pkgs, ... }:

with config.nixos; {
  imports =
    [
      ./enso-greeter.nix
      ./gtk-greeter.nix
    ];

  services.xserver.displayManager.lightdm = {
    enable = true;
    background = settings.xserver.background;

    greeters = {
      enso.enable = true;
      gtk.enable = false;
    };
  };
}
