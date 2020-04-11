{ config, pkgs, ... }:

with config.nixos; {
  imports =
    [
      ./default.nix
      ./bcachefs.nix

      ../modules/backlight
      ../modules/ccache.nix
      ../modules/clight.nix
      ../modules/picom.nix
      ../modules/cups.nix
      ../modules/emacs.nix
      ../modules/i3color.nix
      ../modules/libvirt.nix
      ../modules/logind
      ../modules/lorri.nix
      ../modules/mpd
      ../modules/netdata.nix
      ../modules/network
      ../modules/pulseaudio
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
    kernelPackages = pkgs.linuxPackages_latest_hardened;
  };

  environment = {
    systemPackages = with pkgs; [
      buku
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
      # mongodb
      mysql57
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
      # Build Tools
      cmake
      gnumake
      # Misc
      cachix
      epubcheck
      ffmpeg
      gnupg
      imagemagick7
      nix-diff
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
    enableFontDir = true;
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
    pinentryFlavor = "gtk2";
  };

  programs.zsh = {
    interactiveShellInit = ''
      nix-generate-iso () {
        local flakePath="${./..}"

        if [ ! -z "$1" ]; then
          flakePath="$1"
          shift
        fi

        nix build "$@" --recreate-lock-file "$flakePath#isoImage"
      }

      nix-generate-sd () {
        nix build $@ \
          -f "<nixpkgs/nixos>" \
          --builders "ssh://builder" \
          --arg system '"aarch64-linux"' \
          -I nixos-config=${builtins.toString ./sd-image.nix} \
          config.system.build.sdImage
      }

      nix-cross-compile-sd () {
        nix build $@ \
          -f "<nixpkgs/nixos>" \
          -I nixos-config=${builtins.toString ./cross-sd-image.nix} \
          config.system.build.sdImage
      }

      nix-generate-vm () {
        nix build $@ \
          -f "<nixpkgs/nixos>" \
          -I nixos-config=${builtins.toString ./vm.nix} \
          config.system.build.virtualBoxOVA
      }
    '';
  };

  services.dbus.packages = [ pkgs.gnome3.dconf ];
}
