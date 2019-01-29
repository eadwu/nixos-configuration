{ config, lib, ... }:

with lib;
with config.nixos;

let
  screenOpts = { ... }: {
    options = {
      width = mkOption {
        type = types.int;
        default = settings.machine.screen.width;
        description = ''
        '';
      };

      height = mkOption {
        type = types.int;
        default = settings.machine.screen.height;
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
  options.services.xserver.displayManager.sddm.greeters.chili = {
    background = mkOption {
      type = types.path;
      default = settings.xserver.background;
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
}
