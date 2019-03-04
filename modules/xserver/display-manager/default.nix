{ config, pkgs, ... }:

with config.nixos; {
  imports =
    [
      ./chili.nix
      ./delicious.nix
      ./enso-greeter.nix
      ./gtk-greeter.nix
    ];

  services.xserver.displayManager = {
    lightdm = {
      enable = true;
      background = settings.xserver.background;

      greeters = {
        enso.enable = true;
        gtk.enable = false;
      };
    };

    sddm = {
      enable = false;
      theme = "chili";
    };
  };
}
