{ config, pkgs, ... }:

{
  services = {
    compton = {
      enable = true;
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
      menuOpacity = "0.95";
      opacityRules = [
        "99:name *?= 'EVE'"
        "99:class_g = 'Vivaldi-stable'"
        "85:class_g = 'Code'"
        "85:class_g = 'Code - Insiders'"
        "85:class_g = 'Emacs'"
        "75:class_g = 'URxvt' && !_NET_WM_STATE@:32a"
        "0:_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
        "96:_NET_WM_STATE@:32a *= '_NET_WM_STATE_STICKY'"
      ];
      backend = "glx";
      vSync = "none";
      refreshRate = 0;
      extraOptions = builtins.readFile ./compton.conf;
    };
  };
}
