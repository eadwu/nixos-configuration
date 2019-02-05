{ config, pkgs, lib, ... }:

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
        default = builtins.toString ./credentials/protonvpn;
        description = ''
          The filepath to the file which contains the credentials needed
        '';
      };
    };

    xserver = {
      background = mkOption {
        type = types.path;
        default = "${pkgs.fetchurl {
          url = "https://gitlab.com/eadwu/backgrounds/raw/08819ecf6e286f6d30b0d09b7ac24688b937d576/plasma-5-14-final-4k.jpg";
          sha256 = "07cl6d07s60ighfdc0jjyvp2yacg49argcr2yf5xn1852fia5pjm";
        }}";
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
        default = "${cfg.system.home}/.ssh/nix_builder";
        description = ''
          Path to the private key to be used for SSH connections to the builder
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
          default = builtins.toString ./credentials/wireguard;
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
    nixos.settings.system = with cfg.system; {
      home = "/home/${user}";
      credentials = builtins.toString ./credentials + "/${user}";
    };
  };
}
