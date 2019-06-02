{ pkgs, ... }:

{
  services.dunst = {
    enable = true;

    iconTheme = {
      package = pkgs.paper-icon-theme;
      name = "Paper";
    };

    settings = {
      global = {
        alignment = "center";
        font = "Liberation Mono 10";
        follow = "mouse";
        format = "<b>%s</b>\n%b";
        frame_width = 1;
        frame_color = "#383838";
        geometry = "768x5-6";
        horizontal_padding = 8;
        idle_threshold = 120;
        ignore_newline = false;
        indicate_hidden = true;
        line_height = 0;
        padding = 8;
        separator_color = "#585858";
        separator_height = 2;
        show_age_threshold = 60;
        sort = true;
        startup_notification = false;
        transparency = 10;
        word_wrap = true;
      };

      urgency_low = {
        background = "#181818";
        foreground = "#E3C7AF";
      };

      urgency_normal = {
        background = "#181818";
        foreground = "#E3C7AF";
      };

      urgency_critical = {
        background = "#181818";
        foreground = "#E3C7AF";
      };
    };
  };
}
