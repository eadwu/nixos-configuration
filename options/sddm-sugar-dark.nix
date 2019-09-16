{ config, pkgs, lib, ... }:

with lib;

let
  scfg = config.services.xserver.displayManager.sddm;
  cfg = scfg.greeters.sugar-dark;

  sddm-sugar-dark-custom = pkgs.sddm-sugar-dark.overrideAttrs (
    oldAttrs: {
      postInstall = (oldAttrs.postInstall or "") + ''
        cp -f ${sugarConfig} $out/$installPrefix/$themeName/theme.conf
      '';
    }
  );

  sugarConfig = pkgs.writeText "theme.conf" ''
    [General]
    Background=${cfg.background}
    ScaleImageCropped=${boolToString cfg.scaleImageCropped}
    ScreenWidth=${toString cfg.width}
    ScreenHeight=${toString cfg.height}

    # [Design Customizations]
    ThemeColor=${cfg.design.themeColor}
    AccentColor=${cfg.design.accentColor}
    RoundCorners=${toString cfg.design.roundCorners}
    ScreenPadding=${toString cfg.design.screenPadding}
    Font=${cfg.design.font}
    FontSize=${optionalString (cfg.design.fontSize != null) (toString cfg.design.fontSize)}

    # [Locale Settings]
    Locale=${optionalString (cfg.locale.name != null) cfg.locale.name}
    HourFormat=${optionalString (cfg.locale.hourFormat != null) cfg.locale.hourFormat}
    DateFormat=${optionalString (cfg.locale.dateFormat != null) cfg.locale.dateFormat}

    # [Interface Behavior]
    ForceRightToLeft=${boolToString cfg.interface.forceRightToLeft}
    ForceLastUser=${boolToString cfg.interface.forceLastUser}
    ForcePasswordFocus=${boolToString cfg.interface.forcePasswordFocus}
    ForceHideCompletePassword=${boolToString cfg.interface.forceHideCompletePassword}

    # [Translations]
    HeaderText=${optionalString (cfg.translation.headerText != null) cfg.translation.headerText}
    TranslateUsernamePlaceholder=
    TranslatePasswordPlaceholder=
    TranslateShowPassword=
    TranslateLoginFailed=
    TranslateLogin=
    TranslateSession=
    TranslateSuspend=
    TranslateReboot=
    TranslateShutdown=

    ${cfg.extraConfig}
  '';

  designOpts = { ... }: {
    options = {
      themeColor = mkOption {
        type = types.str;
        default = "navajowhite";
      };

      accentColor = mkOption {
        type = types.str;
        default = "sandybrown";
      };

      roundCorners = mkOption {
        type = types.int;
        default = 20;
      };

      screenPadding = mkOption {
        type = types.int;
        default = 0;
      };

      font = mkOption {
        type = types.str;
        default = "Optician Sans";
      };

      fontSize = mkOption {
        type = types.nullOr types.int;
        default = null;
      };
    };
  };

  localeOpts = { ... }: {
    options = {
      name = mkOption {
        type = types.nullOr types.str;
        default = null;
      };

      hourFormat = mkOption {
        type = types.nullOr types.str;
        default = null;
      };

      dateFormat = mkOption {
        type = types.nullOr types.str;
        default = null;
      };
    };
  };

  interfaceOpts = { ... }: {
    options = {
      forceRightToLeft = mkOption {
        type = types.bool;
        default = false;
      };

      forceLastUser = mkOption {
        type = types.bool;
        default = true;
      };

      forcePasswordFocus = mkOption {
        type = types.bool;
        default = true;
      };

      forceHideCompletePassword = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  translationOpts = { ... }: {
    options = {
      headerText = mkOption {
        type = types.nullOr types.str;
        default = null;
      };
    };
  };
in
{
  options = {
    services.xserver.displayManager.sddm.greeters.sugar-dark = {
      background = mkOption {
        type = types.path;
        default = config.nixos.settings.xserver.background;
      };

      scaleImageCropped = mkOption {
        type = types.bool;
        default = true;
      };

      width = mkOption {
        type = types.int;
        default = config.nixos.settings.machine.screen.width;
      };

      height = mkOption {
        type = types.int;
        default = config.nixos.settings.machine.screen.height;
      };

      design = mkOption {
        type = types.submodule designOpts;
        default = {};
      };

      locale = mkOption {
        type = types.submodule localeOpts;
        default = {};
      };

      interface = mkOption {
        type = types.submodule interfaceOpts;
        default = {};
      };

      translation = mkOption {
        type = types.submodule translationOpts;
        default = {};
      };

      extraConfig = mkOption {
        type = types.lines;
        default = "";
      };
    };
  };

  config = mkIf (scfg.enable && scfg.theme == "sugar-dark") {
    environment.systemPackages = [ sddm-sugar-dark-custom ];
  };
}
