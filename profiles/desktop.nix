{ config, pkgs, ... }:

with import <nixpkgs> { };

let
  optician-sans = stdenv.mkDerivation rec {
    name = "optician-sans-${version}";
    version = "20181212";

    src = pkgs.fetchurl {
      url = "https://optician-sans.com/font-files/v2/OpticianSans.zip";
      sha256 = "0j9spjwgbc2h0pr6vh4hq9ixdxlfszawfcwnsba6y8m3r5r6hycj";
    };

    unpackPhase = ''
      ${pkgs.unzip}/bin/unzip $src -d optician-sans
    '';

    dontBuild = true;

    installPhase = ''
      mkdir -p $out/share/fonts/opentype
      mv optician-sans/*.otf $out/share/fonts/opentype
    '';
  };
in {
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
      optician-sans
      noto-fonts-cjk
      unifont
    ];
  };
}
