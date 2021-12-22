{ pkgs, lib, ... }:

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

    dpi = mkOption {
      type = types.int;
      default = 0;
      description = ''
        Set the DPI of the screen
      '';
    };

    dpiScale = mkOption {
      type = types.int;
      default = 1;
      description = ''
        Sets how DPI should scale on X.Org
      '';
    };

    iccProfile = mkOption {
      type = types.nullOr types.path;
      default = null;
      description = ''
        Color profile to apply to the default monitor (:0)
      '';
    };
  };
}
