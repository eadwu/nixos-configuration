{ sysConfig, pkgs, lib, ... }:

{
  imports =
    [
      ./atom.nix
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
    discord-canary
    element-desktop
    evince
    ghidra-bin
    gimp
    gnome3.gnome-system-monitor
    jetbrains.idea-ultimate
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

    # Benchmarks
    mprime
    unigine-valley
  ];

  nixpkgs = {
    inherit (sysConfig.nixpkgs) config overlays;
  };

  xdg.configFile."nixpkgs/config.nix".text =
    lib.generators.toPretty {} sysConfig.nixpkgs.config;
}
