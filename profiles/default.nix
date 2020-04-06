{ flakes, pkgs, lib, ... }:

{
  imports =
    [
      ../options/settings.nix
      flakes.external.nixosModules.apropos

      ../modules/nix.nix
    ];

  console.earlySetup = true;

  documentation.dev.enable = true;

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
      # Version Control
      git

      # Debug / Utils
      lsof
      blktrace
      iotop
      nix-prefetch-scripts
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
