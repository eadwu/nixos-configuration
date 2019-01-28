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
    supportedFilesystems = [ "ntfs" "bcachefs" ];
    kernelPackages = let
      isStableLatest = pkgs.linux_latest.meta.branch == pkgs.linux_testing.meta.branch;
      needBcachefsSupport = builtins.elem "bcachefs" config.boot.supportedFilesystems;
    in if needBcachefsSupport || isStableLatest
      then lib.mkForce pkgs.linuxPackages_latest
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

  programs.zsh.shellAliases = {
    "home-manager" = ''
      home-manager -2
    '';
    "nix-generate-iso" = ''
      nix build -f "<nixpkgs/nixos>" \
        -I nixos-config=${settings.system.home}/Downloads/nixos-configuration/profiles/iso.nix \
        config.system.build.isoImage
    '';
    "nix-generate-sd" = ''
      nix build -f "<nixpkgs/nixos>" \
        -I nixos-config=${settings.system.home}/Downloads/nixos-configuration/profiles/sd-image.nix \
        config.system.build.sdImage
    '';
    "nix-generate-vm" = ''
      nix build -f "<nixpkgs/nixos>"  \
        -I nixos-config=${settings.system.home}/Downloads/nixos-configuration/profiles/vm.nix \
        config.system.build.virtualBoxOVA
    '';
  };

  services.dbus.packages = lib.singleton pkgs.gnome3.dconf;
}
