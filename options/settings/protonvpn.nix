{ lib, ... }:

with lib;

{
  options.nixos.settings.protonvpn = {
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
}
