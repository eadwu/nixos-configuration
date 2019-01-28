{ config, pkgs, lib, ... }:

with config.nixos; {
  imports =
    [
      ./default.nix

      ../modules/backlight
      ../modules/compton
      ../modules/cups.nix
      ../modules/emacs.nix
      ../modules/i3color.nix
      ../modules/logind
      ../modules/mpd
      ../modules/netdata.nix
      ../modules/network
      ../modules/oblogout.nix
      ../modules/pulseaudio
      ../modules/redshift.nix
      ../modules/tlp.nix
      ../modules/users.nix
      ../modules/virtualisation.nix
      ../modules/watchman.nix
      ../modules/xserver
      ../modules/zsh.nix
    ];

  boot = {
    cleanTmpDir = true;
    kernelPackages = if pkgs.linux_latest.meta.branch == pkgs.linux_testing.meta.branch
      then pkgs.linuxPackages_latest
      else pkgs.linuxPackages_testing;
  };

  environment = {
    systemPackages = with pkgs; [
      buku
      feh
      nnn
      pywal
      xclip
      # Version Control
      gitlab
      gitAndTools.hub
      git-lfs
      # Languages / SDKs
      fsharp
      gcc
      llvmPackages.clang-unwrapped
      mongodb
      mysql57
      nasm
      nodejs
      openjdk
      python
      python3
      rustup
      rWrapper
      sass
      sqlite
      texlive.combined.scheme-full
      ## Haskell
      stack
      # Build Tools
      cmake
      gnumake
      # Misc
      # cachix
      ffmpeg
      gnupg
      imagemagick7
      mono
      oblogout
      rofi
      scrot
      st
      wakatime
      xorg.xsetroot
    ];

    variables = {
      DOCKER_ID_USER = settings.docker.user;
    };
  };

  fonts = {
    enableCoreFonts = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      anonymousPro
      font-awesome_5
      ibm-plex
      liberation_ttf
      optician-sans
      noto-fonts-cjk
      unifont
    ];
  };

  services.dbus.packages = lib.singleton pkgs.gnome3.dconf;
}
