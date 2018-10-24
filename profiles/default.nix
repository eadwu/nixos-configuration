{ config, pkgs, ... }:

let
  settings = import ../settings.nix;
in with pkgs; with settings; {
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
      feh
      gptfdisk
      htop
      libarchive
      openssl
      pass
      pywal
      ranger
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
      DOCKER_ID_USER = DOCKER_ID_USER;
    };
  };

  time = {
    timeZone = "America/New_York";
  };
}
