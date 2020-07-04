{ lib, ... }:

with lib;

{
  options.nixos.settings.xserver = {
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
}
