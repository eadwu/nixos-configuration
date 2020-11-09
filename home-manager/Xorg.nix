{ sysConfig, pkgs, lib, ... }:

{
  xresources.properties = {
    "*foreground" = "#d9c5c8";
    "*background" = "#0c0e14";
    "*cursorColor" = "#d9c5c8";
    "*borderColor" = "#0c0e14";
    "*color0" = "#292929";
    "*color1" = "#f44336";
    "*color2" = "#c3e88d";
    "*color3" = "#ffcb6b";
    "*color4" = "#2c9bf0";
    "*color5" = "#c792ea";
    "*color6" = "#1de9b6";
    "*color7" = "#aaaaaa";
    "*color8" = "#555555";
    "*color9" = "#f44336";
    "*color10" = "#c3e88d";
    "*color11" = "#ffcb6b";
    "*color12" = "#2c9bf0";
    "*color13" = "#c792ea";
    "*color14" = "#1de9b6";
    "*color15" = "#cccccc";
    "*color66" = "#0c0e14";
  } // (with sysConfig.fonts.fontconfig; lib.optionalAttrs (dpi != 0) {
    "*dpi" = dpi;
    "Xft.dpi" = dpi;
  });

  xsession = {
    enable = true;

    pointerCursor = {
      name = "capitaine-cursors";
      package = pkgs.capitaine-cursors;
      size = 32 * sysConfig.nixos.settings.xserver.dpiScale;
    };

    profileExtra = ''
      nitrogen --restore
    '';
  };
}
