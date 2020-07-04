{ pkgs, config, lib, ... }:

with lib;

let
  cfg = config.nixos.settings;
in
{
  options.nixos.settings = {
    credentials = mkOption {
      type = types.nullOr types.path;
      visible = false;
      readOnly = true;
      description = ''
        The directory holding all the credentials
      '';
    };

    docker = {
      user = mkOption {
        type = types.str;
        default = "tianxian";
        description = ''
          The value to be set for the env DOCKER_ID_USER
        '';
      };
    };

    machine = {
      hostname = mkOption {
        type = types.str;
        default = "nixos";
        description = ''
          The desired hostname of the machine
        '';
      };

      screen = {
        width = mkOption {
          type = types.int;
          default = 1440;
          description = ''
          '';
        };

        height = mkOption {
          type = types.int;
          default = 900;
          description = ''
          '';
        };
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
        default = "${cfg.credentials}/protonvpn";
        description = ''
          The filepath to the file which contains the credentials needed
        '';
      };
    };

    xserver = {
      background = mkOption {
        type = types.path;
        default = "${pkgs.nixos-icons}/share/icons/hicolor/128x128/apps/nix-snowflake.png";
        description = ''
          The wallpaper to use in X.Org
        '';
      };

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
        type = types.path;
        visible = false;
        readOnly = true;
        default = "/home/${cfg.system.user}";
        description = ''
          The user account's HOME directory
        '';
      };

      credentials = mkOption {
        type = types.path;
        visible = false;
        readOnly = true;
        default = "${cfg.credentials}/${cfg.system.user}";
        description = ''
          The user account's password file
        '';
      };
    };
    wireguard = {
      client = {
        addresses = mkOption {
          type = types.nullOr (types.listOf types.str);
          default = null;
          description = ''
            Client side IP(s) for tunneling
          '';
        };

        credentials = mkOption {
          type = types.path;
          default = "${cfg.credentials}/wireguard";
          description = ''
            File which contains your private key
          '';
        };

        netns = mkOption {
          type = types.str;
          default = "physical";
          description = ''
            The name of the network namespace to be created for WireGuard
          '';
        };
      };

      server = {
        address = mkOption {
          type = types.nullOr types.str;
          default = null;
          description = ''
            The IP address or server of the server or remote machine
          '';
        };

        credentials = mkOption {
          type = types.nullOr types.str;
          default = null;
          description = ''
            Server's or remote machine's public key
          '';
        };
      };
    };
  };

  config = mkIf (cfg.system.user != null) {
    nixos.settings.credentials = builtins.toString ../credentials;
  };
}
