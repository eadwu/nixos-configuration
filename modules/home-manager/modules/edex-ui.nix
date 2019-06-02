{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.programs.edex-ui;
in {
  options.programs.edex-ui = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Whether to enable eDEX-UI
      '';
    };

    shell = mkOption {
      type = types.string;
      default = "${pkgs.bash}/bin/bash";
      description = ''
        The program to run in the "main shell" window
      '';
    };

    cwd = mkOption {
      type = types.string;
      default = "${config.home.homeDirectory}/.config/eDEX-UI";
      description = ''
        The Current Working Directory in which the shell program will be started
      '';
    };

    keyboard = mkOption {
      type = types.string;
      default = "en-US";
      description = ''
        Which keyboard layout to use
      '';
    };

    theme = mkOption {
      type = types.string;
      default = "tron";
      description = ''
        Which theme to load
      '';
    };

    port = mkOption {
      type = types.int;
      default = 3000;
      description = ''
        The port to use for the websocket connection between your shell and the UI
      '';
    };

    monitor = mkOption {
      type = types.nullOr types.int;
      default = null;
      description = ''
        Which monitor to spawn eDEX on

        If the provided value is not a valid number, will default to the system's primary display
      '';
    };

    allowWindowed = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Allow using the F11 key to switch eDEX to windowed mode
      '';
    };

    experimentalFeatures = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Toggle Chrome's experimental web features

        Useful for very advanced theming

        May introduce security risks
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = singleton pkgs.edex-ui;

    xdg.configFile."eDEX-UI/settings.json".text = ''
      {
        "shell": "${cfg.shell}",
        "cwd": "${cfg.cwd}",
        "keyboard": "${cfg.keyboard}",
        "theme": "${cfg.theme}",
        "port": "${toString cfg.port}",
        ${optionalString (cfg.monitor != null) ''"monitor": "${toString cfg.monitor}",''}
        "allowWindowed": "${toString cfg.allowWindowed}",
        "experimentalFeatures": "${toString cfg.experimentalFeatures}"
      }
    '';
  };
}
