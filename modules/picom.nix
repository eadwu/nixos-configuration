{ lib, ... }:

{
  services.picom = {
    enable = lib.mkDefault true;
    experimentalBackends = true;

    fade = true;
    fadeDelta = 5;
    fadeSteps = [ 0.03 0.03 ];
    fadeExclude = [];
    shadow = true;
    shadowOffsets = [ (-15) (-15) ];
    shadowOpacity = 0.5;
    shadowExclude = [
      "! name~=''"
      "name *= 'picom'"
      "name = 'Notification'"
      "class_g = 'Polybar'"
      "class_g = 'qemu'"
      "class_g = 'qemu-system-x86_64'"
      "class_g = 'Qemu-system-x86_64'"
      "class_g = 'looking-class-client'"
      "_GTK_FRAME_EXTENTS@:c"
    ];
    activeOpacity = 0.95;
    inactiveOpacity = 0.90;
    wintypes = {
      tooltip = {
        fade = true;
        shadow = true;
        opacity = 0.90;
        focus = true;
        full-shadow = false;
      };

      dock = {
        shadow = false;
      };

      dnd = {
        shadow = false;
      };

      popup_menu = {
        opacity = 0.95;
      };

      dropdown_menu = {
        opacity = 0.95;
      };
    };
    opacityRules = [
      "99:name *?= 'EVE'"
      "99:class_g = 'Vivaldi-stable'"
      "99:class_g = 'Vivaldi-snapshot'"
      "99:class_g = 'qemu'"
      "99:class_g = 'qemu-system-x86_64'"
      "99:class_g = 'Qemu-system-x86_64'"
      "99:class_g = 'looking-class-client'"
      "85:class_g = 'Code'"
      "85:class_g = 'Code - Insiders'"
      "85:class_g = 'Emacs'"
      "75:class_g = 'URxvt' && !_NET_WM_STATE@:32a"
      "0:_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
      "96:_NET_WM_STATE@:32a *= '_NET_WM_STATE_STICKY'"
    ];
    backend = "glx";
    vSync = false;
    settings = {
      # GLX backend
      glx-no-stencil = true;

      # Shadows
      shadow-radius = 10;
      shadow-ignore-shaped = false;

      # Opacity
      inactive-opacity-override = false;
      blur-background = true;
      blur-background-fixed = false;
      blur-background-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "class_g = 'qemu'"
        "class_g = 'qemu-system-x86_64'"
        "class_g = 'Qemu-system-x86_64'"
        "class_g = 'looking-class-client'"
      ];

      blur = {
        size = 10;
        strength = 2;
        deviation = 5.0;
        method = "dual_kawase";
      };

      # Other
      mark-wmwin-focused = false;
      mark-ovredir-focused = false;
      use-ewmh-active-win = true;
      detect-rounded-corners = true;
      detect-client-opacity = true;
      sw-opti = false;
      unredir-if-possible = true;
      focus-exclude = [];
      detect-transient = true;
      detect-client-leader = true;
    };
  };
}
