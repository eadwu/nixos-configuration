{ pkgs, config, lib, ... }:

with lib;

let
  cfg = config.nixos.settings;
in
{
  imports =
    [
      ./machine.nix
      ./protonvpn.nix
      ./wireguard.nix
      ./xserver.nix
    ];

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
  };


  config = mkIf (cfg.system.user != null) {
    nixos.settings.credentials = builtins.toString ../credentials;
  };
}
