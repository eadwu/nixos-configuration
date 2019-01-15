{ pkgs, ... }:

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
      nix-prefetch-scripts
      pciutils
      usbutils
    ];

    variables = {
      EDITOR = "vim";
      VISUAL = "vim";
    };
  };

  time = {
    timeZone = "America/New_York";
  };
}
