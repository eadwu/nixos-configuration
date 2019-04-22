{ config, pkgs, lib, ... }:

let
  cachix = (import (builtins.fetchTarball {
    url = "https://cachix.org/api/v1/install";
  }) { }).cachix;

  home-manager = (import (builtins.fetchTarball {
    url = "https://api.github.com/repos/rycee/home-manager/tarball/master";
  }) { }).home-manager;
in with config.nixos; {
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
    supportedFilesystems = [ "ntfs" ];
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
      rWrapper
      sass
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
      ffmpeg
      gnupg
      home-manager
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
      RUST_SRC_PATH = "${pkgs.rustPlatform.rustcSrc}/lib/rustlib/src/rust/src";
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

  programs.zsh = {
    interactiveShellInit = ''
      nix-generate-iso () {
        nix build -f "<nixpkgs/nixos>" \
          -I nixos-config=${builtins.toString ./iso.nix} \
          config.system.build.isoImage
      }

      nix-generate-sd () {
        nix build -f "<nixpkgs/nixos>" \
          --builders "ssh://builder" \
          --arg system '"aarch64-linux"' \
          -I nixos-config=${builtins.toString ./sd-image.nix} \
          config.system.build.sdImage
      }

      nix-generate-vm () {
        nix build -f "<nixpkgs/nixos>"  \
          -I nixos-config=${builtins.toString ./vm.nix} \
          config.system.build.virtualBoxOVA
      }
    '';

    shellAliases = {
      "home-manager" = "home-manager -2";
    };
  };

  services.dbus.packages = lib.singleton pkgs.gnome3.dconf;
}
