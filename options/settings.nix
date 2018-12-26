{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.nixos.custom.settings;
in {
  options.nixos.custom.settings = {
    docker = {
      user = mkOption {
        type = types.str;
        default = "tianxian";
        description = ''
          The value to be set for the env DOCKER_ID_USER
        '';
      };
    };

    nixos = {
      hostname = mkOption {
        type = types.str;
        default = "nixos";
        description = ''
          The desired hostname of the machine
        '';
      };
    };

    protonvpn = {
      region = mkOption {
        type = types.enum [ "jp" "nl" "us" ];
        default = "jp";
        description = ''
          The region to connect to
        '';
      };

      credentials = mkOption {
        type = types.path;
        default = "/etc/nixos/credentials/protonvpn";
        description = ''
          The filepath to the file which contains the credentials needed
        '';
      };
    };

    xserver = {
      dpiScale = mkOption {
        type = types.int;
        default = 1;
        description = ''
          Sets how DPI should scale on X.Org
        '';
      };
    };

    system = {
      user = mkOption {
        type = types.nullOr types.str;
        default = null;
        description = ''
          The username of the user account
        '';
      };

      home = mkOption {
        type = types.nullOr types.path;
        visible = false;
        readOnly = true;
        description = ''
          The user account's HOME directory
        '';
      };

      credentials = mkOption {
        type = types.nullOr types.path;
        visible = false;
        readOnly = true;
        description = ''
          The user account's password file
        '';
      };
    };
  };

  config = mkIf (cfg.system.user != null) {
    nixos.custom.settings.system = with cfg.system; {
      home = "/home/${user}";
      credentials = "/etc/nixos/credentials/${user}";
    };
  };
}
