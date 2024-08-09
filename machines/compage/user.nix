{ systemConfig, pkgs, lib, ... }:

{
  imports = [
    ../../home-manager
    ../../home-manager/hyprland.nix
    ../../home-manager/vscode

    { home.stateVersion = "24.05"; }

    ({ pkgs, ... }@args: {
      xsession.enable = true;

      home.sessionVariables.WLR_NO_HARDWARE_CURSORS = 1;
      home.sessionVariables.WLR_RENDERER_ALLOW_SOFTWARE = 1;
      wayland.windowManager.hyprland.enable = true;
      wayland.windowManager.hyprland.extraConfig = import ./home-manager/hyprland.conf.nix args;

      programs.eww.configDir = ./home-manager/eww;

      # https://github.com/philj56/tofi/blob/master/themes/fullscreen
      home.file.".config/tofi/config".source = ./home-manager/tofi;
    })

    {
      programs.git.signing.key = "4A6F332C9B2B57DA";
      programs.git.signing.signByDefault = true;

      programs.zsh.initExtra = builtins.readFile ./home-manager/zshrc;

      systemd.user.tmpfiles.rules = [
        "L+ %h/.cache/vivaldi-snapshot   - - - - /dev/null"
      ];
    }

    {
      home.pointerCursor.name = "capitaine-cursors";
      home.pointerCursor.package = pkgs.capitaine-cursors;
      home.pointerCursor.gtk.enable = true;

      gtk.enable = true;

      gtk.iconTheme.name = "Paper";
      gtk.iconTheme.package = pkgs.paper-icon-theme;

      gtk.theme.name = "Noita";
      gtk.theme.package = pkgs.gtk-theme-collections;

      gtk.gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    }

    {
      xresources.properties = {
        "*foreground" = "#d9c5c8";
        "*background" = "#0c0e14";
        "*cursorColor" = "#d9c5c8";
        "*borderColor" = "#0c0e14";
        "*color0" = "#292929";
        "*color1" = "#f44336";
        "*color2" = "#c3e88d";
        "*color3" = "#ffcb6b";
        "*color4" = "#2c9bf0";
        "*color5" = "#c792ea";
        "*color6" = "#1de9b6";
        "*color7" = "#aaaaaa";
        "*color8" = "#555555";
        "*color9" = "#f44336";
        "*color10" = "#c3e88d";
        "*color11" = "#ffcb6b";
        "*color12" = "#2c9bf0";
        "*color13" = "#c792ea";
        "*color14" = "#1de9b6";
        "*color15" = "#cccccc";
        "*color66" = "#0c0e14";
      };
    }

    {
      home.packages = with pkgs; [ kitty ranger ];
      home.file.".config/ranger/rc.conf".text = ''
        set preview_images true
        set preview_images_method kitty
      '';
    }

    {
      home.packages = with pkgs; [
        chromium
        vivaldi-snapshot
      ];

      home.activation.setXDGbrowser = lib.hm.dag.entryBefore [ "linkGeneration" ] ''
        ${pkgs.xdg-utils}/bin/xdg-settings set default-web-browser vivaldi-snapshot.desktop
      '';

      xdg.mimeApps.defaultApplications."default-web-browser" = [
        "vivaldi-snapshot.desktop"
        "vivaldi-stable.desktop"
        "chromium.desktop"
      ];
    }

    {
      home.packages = with pkgs; [
        xfce.thunar
        xfce.thunar-volman

        gtk-engine-murrine

        discord-canary
        evince
        gimp
        gnome-system-monitor
        simple-scan
        libreoffice-fresh
        slack
        thunderbird

        bfg-repo-cleaner
        file
        ldns
        lm_sensors
        rclone
        xorg.xprop

        xdg-utils
      ];
    }
  ];
}
