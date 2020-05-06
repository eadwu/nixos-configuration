{ sysConfig, pkgs, lib, ... }:

assert builtins.pathExists ./xmonad/xmonad.hs;

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    polybar
    liberation-mono
  ];

  home.sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = 1;
  };

  xsession.windowManager.xmonad = {
    enable = true;
    haskellPackages = pkgs.haskellPackages;
    enableContribAndExtras = true;
    config = ./xmonad/xmonad.hs;
  };

  services.polybar = {
    enable = true;

    config = rec {
      settings = {
        # No fake transparency, need compositor
        pseudo-transparency = false;

        # Compositing operators
        compositing-background = "source";
        compositing-foreground = "over";
        compositing-overline = "over";
        compositing-underline = "over";
        compositing-border = "over";
      };

      colors = rec {
        background = "#d80c0e14";
        solid-background = ''''${xrdb:*background}'';
        foreground = ''''${xrdb:*foreground}'';

        accent = "#c3e88d";

        color0 = background;
        color1 = ''''${xrdb:*color0}'';
        color2 = ''''${xrdb:*color1}'';
        color3 = ''''${xrdb:*color5}'';
      };

      "section/universal" = rec {
        width = "100%";
        height = 20 * sysConfig.nixos.settings.xserver.dpiScale;
        offset-x = 0;
        offset-y = 0;
        enable-ipc = true;
        override-redirect = true;

        background = colors.background;
        foreground = colors.foreground;

        line-size = 2;
        line-color = colors.accent;

        font-0 = "Comfortaa:size=8;5";
        font-1 = "Font Awesome 5 Free:style=Regular:size=7;3";
        font-2 = "Font Awesome 5 Free:style=Solid:size=7;3";
        font-3 = "Font Awesome 5 Brands:size=7;3";
        font-4 = "Unifont:size=7;3";
        font-5 = "Weather Icons:size=8;4";
        font-6 = "LiterationSans Nerd Font Mono:size=18;12";
      } // (with sysConfig.fonts.fontconfig; lib.optionalAttrs (dpi != 0) { inherit dpi; });

      "bar/workspace" = let
        temperature = "temperature0 temperature1 temperature2 temperature3 temperature4 temperature5 temperature6";
      in {
        "inherit" = "section/universal";
        bottom = true;

        modules-left = "ewmh right-bottom";
        modules-right =
          "left-bottom ${temperature} cpu right-top left-bottom memory";
      };

      "bar/stat" = let
        sep = "right-bottom left-top";
        network = "network0 network1";
      in {
        "inherit" = "section/universal";

        modules-right = "left-top filesystem ${sep} ${network} battery ${sep} backlight volume ${sep} date";
      };

      "section/powerline" = {
        type = "custom/text";
        content-background = colors.background;
        content-foreground = colors.solid-background;
      };

      "module/right-bottom" = {
        "inherit" = "section/powerline";
        content = "%{T7}%{T-}";
      };

      "module/left-bottom" = {
        "inherit" = "section/powerline";
        content = "%{T7}%{T-}";
      };

      "module/right-top" = {
        "inherit" = "section/powerline";
        content = "%{T7}%{T-}";
      };

      "module/left-top" = {
        "inherit" = "section/powerline";
        content = "%{T7}%{T-}";
      };

      "module/ewmh" = {
        type = "internal/xworkspaces";
        icon-default = "KISS";

        label-empty = "%{T3}%{T-}";
        label-empty-background = colors.solid-background;
        label-empty-foreground = "#382e37";
        label-empty-padding = 2;

        label-active = "%{T3}%{T-}";
        label-active-background = colors.solid-background;
        label-active-foreground = colors.accent;
        label-active-overline = colors.accent;
        label-active-underline = colors.accent;
        label-active-padding = 2;

        label-occupied = "%{T3}%{T-}";
        label-occupied-background = colors.solid-background;
        label-occupied-foreground = "#382e37";
        label-occupied-padding = 2;

        label-urgent = "%{T3}%{T-}";
        label-urgent-padding = 2;

        format = "<label-state>";
      };

      "section/temperature" = {
        type = "internal/temperature";
        interval = "0.5";
        thermal-zone = 0;
        warn-temperature = 80;

        label-background = colors.solid-background;
        label-padding = 2;
        label-warn-background = colors.solid-background;
        label-warn-padding = 2;

        format = "%{F#a1887f}<ramp>%{F-} <label>";
        format-background = colors.solid-background;
        format-background-padding-left = 2;
        format-warn = "%{F#a1887f}<ramp>%{F-} <label-warn>";
        format-warn-background = colors.solid-background;
        format-warn-padding-left = 2;

        format-overline = "#5d4037";
        format-warn-overline = "#5d4037";

        ramp-0 = "%{T3}%{T-}";
        ramp-1 = "%{T3}%{T-}";
        ramp-2 = "%{T3}%{T-}";
        ramp-3 = "%{T3}%{T-}";
        ramp-4 = "%{T3}%{T-}";
      };

      "module/temperature0" = {
        "inherit" = "section/temperature";
        hwmon-path = "/sys/devices/platform/coretemp.0/hwmon/hwmon0/temp1_input";
      };

      "module/temperature1" = {
        "inherit" = "section/temperature";
        hwmon-path = "/sys/devices/platform/coretemp.0/hwmon/hwmon1/temp1_input";
      };

      "module/temperature2" = {
        "inherit" = "section/temperature";
        hwmon-path = "/sys/devices/platform/coretemp.0/hwmon/hwmon2/temp1_input";
      };

      "module/temperature3" = {
        "inherit" = "section/temperature";
        hwmon-path = "/sys/devices/platform/coretemp.0/hwmon/hwmon3/temp1_input";
      };

      "module/temperature4" = {
        "inherit" = "section/temperature";
        hwmon-path = "/sys/devices/platform/coretemp.0/hwmon/hwmon4/temp1_input";
      };

      "module/temperature5" = {
        "inherit" = "section/temperature";
        hwmon-path = "/sys/devices/platform/coretemp.0/hwmon/hwmon5/temp1_input";
      };

      "module/temperature6" = {
        "inherit" = "section/temperature";
        hwmon-path = "/sys/devices/platform/coretemp.0/hwmon/hwmon6/temp1_input";
      };

      "module/cpu" = {
        type = "internal/cpu";
        interval = "0.5";

        label = "%percentage%%";

        format = "%{F#a1887f}%{F-} <label> <ramp-coreload>";
        format-background = colors.solid-background;
        format-padding = 2;
        format-overline = "#5d4037";

        ramp-coreload-0 = "%{T5}▁%{T-}";
        ramp-coreload-1 = "%{T5}▂%{T-}";
        ramp-coreload-2 = "%{T5}▃%{T-}";
        ramp-coreload-3 = "%{T5}▄%{T-}";
        ramp-coreload-4 = "%{T5}▅%{T-}";
        ramp-coreload-5 = "%{T5}▆%{T-}";
        ramp-coreload-6 = "%{T5}▇%{T-}";
        ramp-coreload-7 = "%{T5}█%{T-}";
        ramp-coreload-foreground = colors.color2;
      };

      "module/memory" = {
        type = "internal/memory";
        interval = "0.5";

        label = "%percentage_used%%";

        format = "%{F#e57373}%{F-} <label> <bar-used>";
        format-background = colors.solid-background;
        format-padding = 2;
        format-overline = "#d32f2f";

        bar-used-width = 30;
        bar-used-indicator = "|";
        bar-used-fill = "─";
        bar-used-empty = "─";
      };

      "module/filesystem" = {
        type = "internal/fs";
        mount-0 = "/";
        interval = 1;
        fixed-values = true;

        label-mounted = "%{F#ff8a65}%{F-} %free%";
        label-mounted-background = colors.solid-background;
        label-mounted-padding = 2;
        label-unmounted = "%{F#ff8a65}%{F-} N/A";
        label-unmounted-background = colors.solid-background;
        label-unmounted-padding = 2;

        format-mounted = "<label-mounted>";
        format-unmounted = "<label-unmounted>";

        format-mounted-underline = "#e64a19";
        format-unmounted-underline = "#e64a19";
      };

      "section/network" = {
        type = "internal/network";
        interval = 1; # 3.0

        label-connected = "%{F#64b5f6}%{F-} %essid% - %local_ip%";
        label-connected-background = colors.solid-background;
        label-connected-padding = 2;
        label-disconnected = "%{F#64b5f6}%{F-} N/A";
        label-disconnected-background = colors.solid-background;
        label-disconnected-padding = 2;

        format-connected = "<label-connected>";
        format-connected-underline = "#1976d2";
        format-disconnected = "<label-disconnected>";
        format-disconnected-underline = "#1976d2";
        format-packetloss = "<animation-packetloss> <label-connected>";
        format-packetloss-underline = "#1976d2";

        animation-packetloss-0 = "";
      };

      "module/network0" = {
        "inherit" = "section/network";
        interface = "wlan0";
      };

      "module/network1" = {
        "inherit" = "section/network";
        interface = "enp0";
      };

      "module/battery" = {
        type = "internal/battery";
        full-at = 99;
        adapter = "ADP1";
        battery = "BAT0";
        time-format = "%H:%M";
        poll-interval = 1;

        label-full = "%{F#81c784}%{F-} %percentage%%";
        label-charging = "%percentage%% (%time%)";
        label-discharging = "%percentage%% (%consumption%, %time%)";

        format-full = "<label-full>";
        format-full-background = colors.solid-background;
        format-full-padding = 2;
        format-charging = "<animation-charging> <label-charging>";
        format-charging-background = colors.solid-background;
        format-charging-padding = 2;
        format-discharging = "<ramp-capacity> <label-discharging>";
        format-discharging-background = colors.solid-background;
        format-discharging-padding = 2;

        format-full-underline = "#388e3c";
        format-charging-underline = "#388e3c";
        format-discharging-underline = "#388e3c";

        ramp-capacity-0 = "%{F#e57373}%{F-}";
        ramp-capacity-1 = "%{F#e57373}%{F-}";
        ramp-capacity-2 = "%{F#fff176}%{F-}";
        ramp-capacity-3 = "%{F#81c784}%{F-}";
        ramp-capacity-4 = "%{F#81c784}%{F-}";

        animation-charging-0 = "%{F#e57373}%{F-}";
        animation-charging-1 = "%{F#e57373}%{F-}";
        animation-charging-2 = "%{F#fff176}%{F-}";
        animation-charging-3 = "%{F#81c784}%{F-}";
        animation-charging-4 = "%{F#81c784}%{F-}";
        animation-charging-framerate = 750;
      };

      "module/backlight" = {
        type = "internal/backlight";
        card = "intel_backlight";

        label = "%percentage%%";

        format = "%{F#fff176}<ramp>%{F-} <label> <bar>";
        format-background = colors.solid-background;
        format-padding = 2;
        format-underline = "#fbc02d";

        bar-empty = "%{T5}━%{T-}";
        bar-empty-foreground = colors.color1;
        bar-fill = "%{T5}━%{T-}";
        bar-foreground-0 = colors.color2;
        bar-gradient = false;
        bar-indicator = "%{T5}|%{T-}";
        bar-indicator-foreground = colors.color2;
        bar-width = 15;

        ramp-0 = "%{T6}%{T-}";
        ramp-1 = "%{T6}%{T-}";
        ramp-2 = "%{T6}%{T-}";
        ramp-3 = "%{T6}%{T-}";
        ramp-4 = "%{T6}%{T-}";
        ramp-5 = "%{T6}%{T-}";
        ramp-6 = "%{T6}%{T-}";
        ramp-7 = "%{T6}%{T-}";
        ramp-8 = "%{T6}%{T-}";
        ramp-9 = "%{T6}%{T-}";
        ramp-10 = "%{T6}%{T-}";
        ramp-11 = "%{T6}%{T-}";
        ramp-12 = "%{T6}%{T-}";
        ramp-13 = "%{T6}%{T-}";
        ramp-14 = "%{T6}%{T-}";
      };

      "module/volume" = {
        type = "internal/alsa";

        label-muted = "%{F#e57373}%{F-} muted";
        label-volume = "%percentage%%";

        format-muted = "<label-muted>";
        format-muted-underline = "#5d4037";
        format-muted-background = colors.solid-background;
        format-muted-padding = 2;
        format-volume = "%{F#e57373}<ramp-volume>%{F-} <label-volume> <bar-volume>";
        format-volume-background = colors.solid-background;
        format-volume-padding = 2;
        format-volume-underline = "#5d4037";

        bar-volume-empty = "%{T5}━%{T-}";
        bar-volume-empty-foreground = colors.color1;
        bar-volume-fill = "%{T5}━%{T-}";
        bar-volume-foreground-0 = colors.color2;
        bar-volume-gradient = false;
        bar-volume-indicator = "%{T5}|%{T-}";
        bar-volume-indicator-foreground = colors.color2;
        bar-volume-width = 15;

        ramp-volume-0 = "";
        ramp-volume-1 = "";
        ramp-volume-2 = "";
      };

      "module/date" = {
        type = "internal/date";
        interval = 1;
        date = "%A, %B %d %Y";
        date-alt = "%a %b %d";
        time = "%r";
        time-alt = "%I:%M %p";

        label = "%{F#81c784}%{F-} %date% %{F#81c784}%{F-} %time%";
        label-background = colors.solid-background;
        label-padding = 2;

        format-underline = "#388e3c";
      };
    };

    script = ''
      ${pkgs.polybar}/bin/polybar -r stat &
      ${pkgs.polybar}/bin/polybar -r workspace &
    '';
  };
}
