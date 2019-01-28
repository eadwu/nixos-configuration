{ pkgs, lib, ... }:

{
  imports =
    [
      ../options/settings.nix

      ../modules/nix.nix
    ];

  environment = {
    shells = [
      "${pkgs.zsh}/bin/zsh"
    ];

    systemPackages = with pkgs; [
      gptfdisk
      htop
      libarchive
      openssl
      nixopsUnstable
      pass
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
      nix-universal-prefetch
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
