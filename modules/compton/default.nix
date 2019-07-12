{ lib, ... }:

{
  services.compton = {
    enable = lib.mkDefault true;

    fade = true;
    fadeDelta = 5;
    fadeSteps = [
      "0.03"
      "0.03"
    ];
    fadeExclude = [];
    shadow = true;
    shadowOffsets = [
      (-15)
      (-15)
    ];
    shadowOpacity = "0.5";
    shadowExclude = [
      "! name~=''"
      "name *= 'compton'"
      "name = 'Notification'"
      "class_g = 'Polybar'"
      "_GTK_FRAME_EXTENTS@:c"
    ];
    activeOpacity = "0.95";
    inactiveOpacity = "0.85";
    wintypes = {
      tooltip = {
        fade = true;
        shadow = true;
        opacity = "0.85";
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
        opacity = "0.95";
      };

      dropdown_menu = {
        opacity = "0.95";
      };
    };
    opacityRules = [
      "99:name *?= 'EVE'"
      "99:class_g = 'Vivaldi-stable'"
      "99:class_g = 'Vivaldi-snapshot'"
      "85:class_g = 'Code'"
      "85:class_g = 'Code - Insiders'"
      "85:class_g = 'Emacs'"
      "75:class_g = 'URxvt' && !_NET_WM_STATE@:32a"
      "0:_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
      "96:_NET_WM_STATE@:32a *= '_NET_WM_STATE_STICKY'"
    ];
    backend = "glx";
    vSync = false;
    refreshRate = 0;
    extraOptions = lib.optionalString (builtins.pathExists ./compton.conf) builtins.readFile ./compton.conf;
  };
}
