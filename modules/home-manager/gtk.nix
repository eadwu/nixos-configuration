{ flakes, pkgs, ... }:

{
  gtk = {
    enable = true;

    font = {
      name = "IBM Plex Mono";
      package = pkgs.ibm-plex;
    };

    iconTheme = {
      name = "Paper";
      package = pkgs.paper-icon-theme;
    };

    theme = {
      name = "Noita";
      package = flakes.external.gtk-theme-collections;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
}
