{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    font = "Optician Sans 8";
    lines = 30;
    location = "left";
    padding = 28;
    scrollbar = false;
    separator = "none";
    terminal = "${pkgs.st}/bin/st";
    theme = "~/.config/rofi/theme.rasi";
    width = -50;
    borderWidth = 0;

    extraConfig = ''
      rofi.columns: 1
      rofi.dpi: 1
      rofi.modi: drun,run,window,ssh
      rofi.show-icons: true
    '';
  };

  xdg.configFile."rofi/theme.rasi".source = ./rofi/theme.rasi;
}
