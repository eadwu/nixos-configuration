{ config, pkgs, ... }:

with pkgs; with config.nixos.custom; {
  boot = {
    cleanTmpDir = true;
    kernelPackages = if linux_latest.meta.branch == linux_testing.meta.branch
      then linuxPackages_latest
      else linuxPackages_testing;
  };

  environment = {
    shells = [
      "${pkgs.zsh}/bin/zsh"
    ];

    systemPackages = with pkgs; [
      buku
      feh
      gptfdisk
      htop
      libarchive
      nnn
      openssl
      pass
      pywal
      tree
      unrar
      unzip
      vim
      wget
      xclip
      zip
      # Version Control
      git
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
      ffmpeg
      gnupg
      imagemagick7
      mono
      oblogout
      scrot
      xorg.xsetroot

      # Debug / Utils
      lsof
      nix-prefetch-scripts
      pciutils
      usbutils
    ];

    variables = {
      EDITOR = "vim";
      VISUAL = "vim";
      DOCKER_ID_USER = settings.docker.user;
    };
  };

  services = {
    dbus = {
      packages = with pkgs; [
        gnome3.dconf
      ];
    };
  };

  time = {
    timeZone = "America/New_York";
  };
}
