{ lib, ... }:

with lib;

{
  options.nixos.settings.machine = {
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
}
