{ config, pkgs, lib, ... }:

with config.nixos; {
  imports =
    [
      ./lightdm/enso-greeter.nix
      ./lightdm/gtk-greeter.nix

      ./sddm/sugar-dark.nix
    ];

  # services.displayManager.defaultSession = "none+dwm";
  services.xserver.displayManager = {
    lightdm = {
      enable = false;
      background = settings.xserver.background;

      greeters = {
        enso.enable = true;
        gtk.enable = false;
      };
    };
  };

  services.displayManager.sddm = {
    enable = true;
    theme = "sugar-dark";

    # # enableKwinWayland = true;
    # settings = {
    #   General = {
    #     GreeterEnvironment = "QT_PLUGIN_PATH=${pkgs.plasma5Packages.layer-shell-qt}/${pkgs.plasma5Packages.qtbase.qtPluginPrefix},QT_WAYLAND_SHELL_INTEGRATION=layer-shell";
    #     DisplayServer = "wayland";
    #     InputMethod = "";
    #   };
    #   Wayland.CompositorCommand = "${pkgs.plasma5Packages.kwin}/bin/kwin_wayland --no-global-shortcuts --no-lockscreen --locale1";
    # };

    settings.General.InputMethod = lib.mkForce "";
  };

/*
  security.pam.u2f = {
    enable = true;
    control = "required";
  };

  security.pam.services = {
    lightdm.u2fAuth = true;
    sddm.u2fAuth = true;
  };
*/
}
