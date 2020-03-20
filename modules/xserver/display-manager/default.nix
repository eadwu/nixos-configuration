{ config, pkgs, ... }:

with config.nixos; {
  imports =
    [
      ./lightdm/enso-greeter.nix
      ./lightdm/gtk-greeter.nix

      ./sddm/sugar-dark.nix
    ];

  services.xserver.displayManager = {
    defaultSession = "none+hm";

    lightdm = {
      enable = false;
      background = settings.xserver.background;

      greeters = {
        enso.enable = true;
        gtk.enable = false;
      };
    };

    sddm = {
      enable = true;
      theme = "sugar-dark";

      extraConfig = ''
        [General]
        InputMethod=
      '';
    };
  };

  security.pam.u2f = {
    enable = true;
    control = "required";
  };

  security.pam.services = {
    lightdm.u2fAuth = true;
    sddm.u2fAuth = true;
  };
}
