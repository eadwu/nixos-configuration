{ pkgs, lib, ... }:

with lib;

let
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
        type = types.str;
        default = "Welcome!";
      };
    };
  };
in {
  options.services.xserver.displayManager.sddm.greeters.sugar-dark = {
    scaleImageCropped = mkOption {
      type = types.bool;
      default = true;
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
}
