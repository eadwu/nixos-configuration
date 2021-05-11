{ nixosModules, pkgs, lib, ... }:

{
  imports =
    [
      nixosModules.settings

      ../hardware/devices/zsa
      ../modules/nix.nix
    ];

  console.earlySetup = true;

  documentation.dev.enable = true;
  documentation.man.generateCaches = true;

  environment = {
    shells = [
      "${pkgs.zsh}/bin/zsh"
    ];

    systemPackages = with pkgs; [
      fzf
      gptfdisk
      htop
      libarchive
      openssl
      man-pages
      nixopsUnstable
      nix-index
      nixpkgs-fmt
      pass
      ripgrep
      tree
      unrar
      unzip
      vim
      wget
      zip
      zstd
      # Version Control
      _aliases.git

      # Debug / Utils
      lsof
      blktrace
      iotop
      nix-prefetch-scripts
      patchelf
      pciutils
      usbutils
    ];

    variables = {
      EDITOR = "vim";
      VISUAL = "vim";
    };
  };

  services.fstrim.enable = lib.mkDefault true;

  time = {
    timeZone = "America/New_York";
  };
}
