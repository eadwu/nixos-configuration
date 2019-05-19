{ config, pkgs, ... }:

with config.nixos; {
  imports =
    [
      ./lightdm/enso-greeter.nix
      ./lightdm/gtk-greeter.nix

      ./sddm/chili.nix
      ./sddm/delicious.nix
      ./sddm/sugar-dark.nix
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
      theme = "sugar-dark";
    };
  };
}
