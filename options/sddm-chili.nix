{ config, pkgs, lib, ... }:

with lib;

let
  scfg = config.services.xserver.displayManager.sddm;
  cfg = scfg.greeters.chili;

  chiliConfig = pkgs.writeText "theme.conf" ''
    [General]
    background=${cfg.background}

    ScreenWidth=${toString cfg.screen.width}
    ScreenHeight=${toString cfg.screen.height}

    blur=${boolToString cfg.blur.enable}
    recursiveBlurLoops=${toString cfg.blur.loops}
    recursiveBlurRadius=${toString cfg.blur.radius}

    PasswordFieldOutlined=${boolToString cfg.passwordFieldOutlined}

    PowerIconSize=${optionalString (cfg.powerIconSize != null) (toString cfg.powerIconSize)}
    FontPointSize=${optionalString (cfg.fontPointSize != null) (toString cfg.fontPointSize)}
    AvatarPixelSize=${optionalString (cfg.avatarPixelSize != null) (toString cfg.avatarPixelSize)}

    translationReboot=${optionalString (cfg.translation.reboot != null) cfg.translation.reboot}
    translationSuspend=${optionalString (cfg.translation.suspend != null) cfg.translation.suspend}
    translationPowerOff=${optionalString (cfg.translation.poweroff != null) cfg.translation.poweroff}

    ${cfg.extraConfig}
  '';

  screenOpts = { ... }: {
    options = {
      width = mkOption {
        type = types.int;
        default = config.nixos.settings.machine.screen.width;
        description = ''
        '';
      };

      height = mkOption {
        type = types.int;
        default = config.nixos.settings.machine.screen.height;
        description = ''
        '';
      };
    };
  };

  blurOpts = { ... }: {
    options = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = ''
        '';
      };

      loops = mkOption {
        type = types.int;
        default = 5;
        description = ''
        '';
      };

      radius = mkOption {
        type = types.int;
        default = 15;
        description = ''
        '';
      };
    };
  };

  translationOpts = { ... }: {
    options = {
      reboot = mkOption {
        type = types.nullOr types.str;
        default = null;
        description = ''
        '';
      };

      suspend = mkOption {
        type = types.nullOr types.str;
        default = null;
        description = ''
        '';
      };

      poweroff = mkOption {
        type = types.nullOr types.str;
        default = null;
        description = ''
        '';
      };
    };
  };
in {
  options = {
    services.xserver.displayManager.sddm.greeters.chili = {
      background = mkOption {
        type = types.path;
        default = config.nixos.settings.xserver.background;
        description = ''
        '';
      };

      screen = mkOption {
        type = types.submodule screenOpts;
        default = {};
        description = ''
        '';
      };

      blur = mkOption {
        type = types.submodule blurOpts;
        default = {};
        description = ''
        '';
      };

      passwordFieldOutlined = mkOption {
        type = types.bool;
        default = false;
        description = ''
        '';
      };

      powerIconSize = mkOption {
        type = types.nullOr types.int;
        default = null;
        description = ''
        '';
      };

      fontPointSize = mkOption {
        type = types.nullOr types.int;
        default = null;
        description = ''
        '';
      };

      avatarPixelSize = mkOption {
        type = types.nullOr types.int;
        default = null;
        description = ''
        '';
      };

      translation = mkOption {
        type = types.submodule translationOpts;
        default = {};
        description = ''
        '';
      };

      extraConfig = mkOption {
        type = types.lines;
        default = "";
        description = ''
        '';
      };
    };
  };

  config = mkIf (scfg.enable && scfg.theme == "chili") {
    environment.systemPackages = singleton
      (pkgs.sddm-chili.overrideAttrs (oldAttrs: {
        postInstall = (oldAttrs.postInstall or "") + ''
          cp -f ${chiliConfig} $out/$installPrefix/$themeName/theme.conf
        '';
      }));
  };
}
