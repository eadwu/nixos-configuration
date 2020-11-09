{ config, pkgs, lib, ... }:

with config.nixos; {
  imports =
    [
      ./default.nix

      ../modules/audio.nix
      ../modules/backlight
      ../modules/clight.nix
      ../modules/picom.nix
      ../modules/cups.nix
      ../modules/emacs.nix
      ../modules/i3color.nix
      ../modules/logind
      ../modules/lorri.nix
      ../modules/monitoring
      ../modules/network
      ../modules/tlp.nix
      ../modules/users.nix
      ../modules/virtualisation.nix
      ../modules/watchman.nix
      ../modules/xserver
      ../modules/zsh.nix
    ];

  boot = {
    cleanTmpDir = true;
    supportedFilesystems = [ "ntfs" ];
  };

  environment = {
    pathsToLink = [
      "share/hunspell"
      "share/myspell/dicts"
    ];

    systemPackages = with pkgs; [
      feh
      nnn
      pywal
      xclip
      # Version Control
      gitAndTools.hub
      git-lfs
      # Languages / SDKs
      gcc
      gdb
      llvmPackages.clang-unwrapped
      mongodb
      mysql
      nasm
      nodejs
      openjdk
      python3
      multimarkdown
      rWrapper
      sass
      sbt
      scala
      sqlite
      texlive.combined.scheme-full
      ## Haskell
      stack
      ## Rust
      rustPlatform.rust
      rust-analyzer
      rustfmt
      # Build Tools
      cmake
      gnumake
      # Misc
      archiver
      cachix
      epubcheck
      ffmpeg
      gnupg
      hunspell
      hunspellDicts.en_US
      hunspellDicts.en_US-large
      imagemagick7
      nix-diff
      nix-linter
      rofi
      scrot
      st
      wakatime
      xorg.xsetroot
    ];

    variables = {
      DOCKER_ID_USER = settings.docker.user;
      RUST_SRC_PATH = "${pkgs.rustPlatform.rust-src}/lib/rustlib/src/rust/src";
    };
  };

  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      anonymousPro
      comfortaa
      corefonts
      font-awesome_5
      ibm-plex
      liberation_ttf
      noto-fonts-cjk
      recursive
      unifont
      weather-icons
    ];
  };

  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "gnome3";
  };

  programs.zsh = {
    interactiveShellInit = let
      commands = {
        nix-generate-iso = "isoImage";
        nix-generate-sd = "sdImage";
        nix-cross-compile-sd = "crossSdImage";
        nix-generate-vm = "ovaImage";
      };
    in lib.concatMapStringsSep "\n" (cmd: ''
      ${cmd} () {
        local flakePath="${./..}"

        if [ ! -z "$1" ]; then
          flakePath="$1"
          shift
        fi

        nix build "$@" "$flakePath#${commands.${cmd}}"
      }
    '') (builtins.attrNames commands);
  };

  services.dbus.packages = [ pkgs.gnome3.dconf ];
}
