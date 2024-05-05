{ sysConfig, pkgs, lib, ... }:

{
  imports =
    [
      # ./blender.nix
      ./code.nix
      # ./clight.nix
      ./dunst.nix
      # ./emacs.nix
      ./glava.nix
      ./git.nix
      ./gtk.nix
      ./mpd.nix
      ./mpv.nix
      ./ncmpcpp.nix
      ./rofi.nix
      ./ssh.nix
      ./vim.nix
      ./zsh.nix
      ./Xorg.nix
    ];

  home.activation.setXDGbrowser = lib.hm.dag.entryBefore [ "linkGeneration" ] ''
    ${pkgs.xdg-utils}/bin/xdg-settings set default-web-browser vivaldi-snapshot.desktop
  '';

  xdg.mimeApps.defaultApplications."default-web-browser" = [
    "vivaldi-snapshot.desktop" "vivaldi-stable.desktop" "chromium.desktop"
  ];

  home.packages = with pkgs; [
    # Environment
    nitrogen
    xfce.thunar
    xfce.thunar-volman
    xfce.xfce4-screenshooter
    ## Theme
    gtk-engine-murrine

    # Other
    ## Applications
    ark
    chromium
    discord-canary
    element-desktop
    evince
    ghidra-bin
    gimp
    gnome.gnome-system-monitor
    gnome.simple-scan
    # jetbrains.idea-community
    krita
    libreoffice-fresh
    # rstudioWrapper
    slack
    thunderbird
    # typora
    vivaldi-snapshot
    woeusb-ng
    xournalpp
    ## Console
    bfg-repo-cleaner
    buku
    file
    ldns
    lm_sensors
    pipes
    rclone
    xorg.xprop
    xwinwrap
    yarn
    youtube-dl
    ## Misc
    xdg-utils

    # Benchmarks
    mprime
    # unigine-valley

    # Other
    # gephi

    ranger
  ];

  home.file.".config/ranger/rc.conf".text = ''
    set preview_images true
    set preview_images_method kitty
  '';

  # nixpkgs = {
  #   inherit (sysConfig.nixpkgs) config overlays;
  # };

  xdg.enable = true;
  xdg.configFile."nixpkgs/config.nix".text =
    lib.generators.toPretty { } sysConfig.nixpkgs.config;
}
