{ config, pkgs, ... }:

{
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
      ../modules/nix.nix
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

  environment = {
    systemPackages = with pkgs; [
      # Applications
      rofi
      st
      ### Emacs
      wakatime
      # Console
      cachix
      home-manager
    ];
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
      noto-fonts-cjk
      ubuntu_font_family
      unifont
    ];
  };
}
