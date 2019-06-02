{ pkgs, ... }:

{
  services.polybar = {
    enable = true;

    config = {
      "bar/data" = {
        enable-ipc = true;
        modules-right = "temperature0 temperature1 temperature2 temperature3 cpu memory seperator filesystem network0 network1 network2 network3 battery backlight volume date time";
      };

      "module/seperator" = {
        type = "custom/text";
        content = ";";
      };

      "section/temperature" = {
        type = "internal/temperature";
        interval = 1;
        thermal-zone = 0;
        warn-temperature = 80;

        format = "[ <ramp> <label> ]";
        format-warn = "[ <ramp> <label-warn> ]";

        ramp-0 = "";
        ramp-1 = "";
        ramp-2 = "";
        ramp-3 = "";
        ramp-4 = "";
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

      "module/cpu" = {
        type = "internal/cpu";
        interval = "0.5";

        label = "%percentage%%";

        format = "[  <label> <ramp-coreload> ]";

        ramp-coreload-0 = "▁";
        ramp-coreload-1 = "▂";
        ramp-coreload-2 = "▃";
        ramp-coreload-3 = "▄";
        ramp-coreload-4 = "▅";
        ramp-coreload-5 = "▆";
        ramp-coreload-6 = "▇";
        ramp-coreload-7 = "█";
      };

      "module/memory" = {
        type = "internal/memory";
        interval = "0.5";

        label = "%percentage_used%%";

        format = "[  <label> <bar-used> ]";

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

        label-mounted = "[  %free% ]";
        label-unmounted = "[  N/A ]";

        format-mounted = "<label-mounted>";
        format-unmounted = "<label-unmounted>";
      };

      "section/network" = {
        type = "internal/network";
        interval = 1;

        label-connected = "[  %essid% - %local_ip% ]";
        label-disconnected = "[  N/A ]";

        format-connected = "<label-connected>";
        format-disconnected = "<label-disconnected>";
        format-packetloss = "<animation-packetloss> <label-connected>";
        animation-packetloss-0 = "";
      };

      "module/network0" = {
        "inherit" = "section/network";
        interface = "wlan0";
      };

      "module/network1" = {
        "inherit" = "section/network";
        interface = "wlp2s0";
      };

      "module/network2" = {
        "inherit" = "section/network";
        interface = "wlp59s0";
      };

      "module/network3" = {
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

        label-full = " %percentage%%";
        label-charging = "%percentage%% - %time%";
        label-discharging = "%percentage%% - %consumption%W, %time%";

        format-full = "[ <label-full> ]";
        format-charging = "[ <animation-charging> <label-charging> ]";
        format-discharging = "[ <ramp-capacity> <label-discharging> ]";

        ramp-capacity-0 = "";
        ramp-capacity-1 = "";
        ramp-capacity-2 = "";
        ramp-capacity-3 = "";
        ramp-capacity-4 = "";

        animation-charging-0 = "";
        animation-charging-1 = "";
        animation-charging-2 = "";
        animation-charging-3 = "";
        animation-charging-4 = "";
        animation-charging-framerate = 750;
      };

      "module/backlight" = {
        type = "internal/backlight";
        card = "intel_backlight";

        label = "%percentage%%";

        format = "[ <ramp> <label> <bar> ]";

        bar-empty = "━";
        bar-fill = "━";
        bar-indicator = "|";
        bar-width = 15;

        ramp-0 = "🌕";
        ramp-1 = "🌔";
        ramp-2 = "🌓";
        ramp-3 = "🌒";
        ramp-4 = "🌑";
      };

      "module/volume" = {
        type = "internal/pulseaudio";

        label-muted = " muted";
        label-volume = "%percentage%%";

        format-muted = " [ <label-muted> ]";
        format-volume = " [ <ramp-volume> <label-volume> <bar-volume> ]";

        bar-volume-empty = "━";
        bar-volume-fill = "━";
        bar-volume-indicator = "|";
        bar-volume-width = 15;

        ramp-volume-0 = "";
        ramp-volume-1 = "";
        ramp-volume-2 = "";
      };

      "module/date" = {
        type = "internal/date";
        interval = 1;
        date = "%a %b %d";

        label = "[  %date% ]";
      };

      "module/time" = {
        type = "internal/date";
        interval = 1;
        time = "%I:%M %p";

        label = "[  %time% ]";
      };
    };

    script = ''
      ${pkgs.polybar}/bin/polybar -r -s data | \
        while IFS= read -r line;
        do
          ${pkgs.xorg.xsetroot}/bin/xsetroot -name "$(printf "%s" "$line" | \
            ${pkgs.perl}/bin/perl -pe 's/%\{.+?\}//g')";
        done &
    '';
  };
}
