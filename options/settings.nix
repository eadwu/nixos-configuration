{ config, lib, ... }:

with lib;

let
  cfg = config.nixos.settings;
in {
  options.nixos.settings = {
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

    machines.rpi = {
      hostName = mkOption {
        type = types.str;
        visible = false;
        readOnly = true;
        default = "192.168.1.209";
        description = ''
          Private IP of my raspberry pi 3 b+
        '';
      };

      identityFile = mkOption {
        type = types.path;
        default = builtins.toPath "${cfg.system.home}/.ssh/nix_builder";
        description = ''
          Path to the private key to be used for SSH connections to the builder
        '';
      };
    };
  };

  config = mkIf (cfg.system.user != null) {
    nixos.settings.system = with cfg.system; {
      home = "/home/${user}";
      credentials = "/etc/nixos/credentials/${user}";
    };
  };
}
