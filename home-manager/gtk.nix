{ pkgs, ... }:

{
  home.pointerCursor.gtk.enable = true;

  gtk = {
    enable = true;

    iconTheme = {
      name = "Paper";
      package = pkgs.paper-icon-theme;
    };

    theme = {
      name = "Noita";
      package = pkgs.gtk-theme-collections;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
}
