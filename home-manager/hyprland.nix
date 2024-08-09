{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # Terminal
    kitty
    alacritty
    # Application Launcher
    tofi
    # Status Bar
    eww
    # Clipboard
    wl-clipboard
    # Wallpaper
    hyprpaper
    # Color Picker
    hyprpicker
    # Eww widget dependencies
    jq
    socat
    # Fonts
    liberation-mono
    # Screenshot
    grim
    slurp
  ];

  home.sessionVariables._JAVA_AWT_WM_NONREPARENTING = 1;

  home.sessionVariables.GDK_BACKEND = "wayland,x11";
  home.sessionVariables.QT_QPA_PLATFORM = "wayland;xcb";
  home.sessionVariables.SDL_VIDEODRIVER = "wayland";
  home.sessionVariables.CLUTTER_BACKEND = "wayland";

  programs.eww.enable = true;
  programs.eww.package = pkgs.eww;

  wayland.windowManager.hyprland.xwayland.enable = true;
  wayland.windowManager.hyprland.systemd.enable = true;
}
