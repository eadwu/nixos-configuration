{ sysConfig, pkgs, lib, ... }:

{
  imports =
    [
      ./blender.nix
      ./code.nix
      ./clight.nix
      ./dunst.nix
      ./emacs.nix
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
    xdg-settings set default-web-browser vivaldi-snapshot.desktop
  '';

  xdg.mimeApps.defaultApplications =
    let
      web_browser = [ "vivaldi-snapshot.desktop" "vivaldi-stable.desktop" "chromium.desktop" ];
    in
    {
      "default-web-browser" = web_browser;
    };

  home.packages = with pkgs; [
    # Environment
    nitrogen
    xfceUnstable.thunar
    xfceUnstable.thunar-volman
    xfceUnstable.xfce4-screenshooter
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
    gnome3.gnome-system-monitor
    gnome3.simple-scan
    jetbrains.idea-ultimate
    libreoffice-fresh
    radian
    rstudioWrapper
    slack
    thunderbird
    typora
    vivaldi-snapshot
    woeusb
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
    xdg_utils

    # Benchmarks
    mprime
    unigine-valley
  ];

  nixpkgs = {
    inherit (sysConfig.nixpkgs) config overlays;
  };

  xdg.enable = true;
  xdg.configFile."nixpkgs/config.nix".text =
    lib.generators.toPretty { } sysConfig.nixpkgs.config;
}
