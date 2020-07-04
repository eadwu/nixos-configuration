{ lib, ... }:

with lib;

{
  options.nixos.settings.wireguard = {
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
}
