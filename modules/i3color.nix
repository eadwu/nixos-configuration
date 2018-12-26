{ config, pkgs, ... }:

with config.nixos.custom; {
  systemd = {
    services = {
      i3color = {
        before = [
          "sleep.target"
          "systemd-suspend.service"
          "systemd-hibernate.target"
        ];
        description = "i3lock with suspend/sleep";
        enable = true;
        environment = {
          DISPLAY = ":0";
        };
        serviceConfig = {
          Type = "forking";
          User = settings.system.user;
        };
        script = ''
          image=$(mktemp --suffix=.png)
          trap 'rm -f "$image"' SIGINT SIGTERM EXIT

          ${pkgs.ffmpeg}/bin/ffmpeg -f x11grab -y \
            -s "$(${pkgs.xorg.xdpyinfo}/bin/xdpyinfo | grep dimensions | ${pkgs.gawk}/bin/gawk '{print $2}')" \
            -i $DISPLAY \
            -loglevel quiet -probesize 16MB \
            -vframes 1 -vf gblur=sigma=8 \
            "$image"

          ${pkgs.i3lock-color}/bin/i3lock-color \
            --image="$image" \
            --insidecolor=282828FF \
            --insidevercolor=FABD2FFF \
            --insidewrongcolor=FB4934FF \
            --ringcolor=282828FF \
            --ringvercolor=282828FF \
            --ringwrongcolor=282828FF \
            --linecolor=EBDBB2FF \
            --keyhlcolor=EBDBB2FF \
            --bshlcolor=FB4934FF \
            --separatorcolor=282828FF \
            --timecolor=EBDBB2FF \
            --datecolor=00000000 \
            --layoutcolor=00000000 \
            --indpos='x+100:y+720' \
            --timepos='x+210:y+732' \
            --timestr='%I:%M %p' \
            --time-font='IBM Plex Mono' \
            --force-clock \
            --refresh-rate=30 \
            --radius=32 \
            --ring-width=4 \
            --veriftext="" \
            --wrongtext="" \
            --noinputtext="" \
            --ignore-empty-password
        '';
        wantedBy = [
          "sleep.target"
          "suspend.target"
          "hibernate.target"
        ];
      };
    };
  };
}
