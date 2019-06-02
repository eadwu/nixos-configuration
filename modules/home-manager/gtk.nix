{ pkgs, ... }:

let
  gtk-theme-collections = pkgs.stdenv.mkDerivation rec {
    pname = "gtk-theme-collections";
    version = "master";

    src = builtins.fetchGit {
      url = "https://github.com/addy-dclxvi/gtk-theme-collections";
      ref = version;
    };

    dontBuild = true;

    installPhase = ''
      mkdir -p $out/share/themes
      find . -mindepth 1 -maxdepth 1 -type d -exec cp -r "{}" $out/share/themes \;
    '';
  };
in {
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
      package = gtk-theme-collections;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
}
