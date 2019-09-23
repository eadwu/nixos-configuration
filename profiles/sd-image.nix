{ pkgs, lib, ... }:

with lib; {
  imports = [ <nixpkgs/nixos/modules/installer/cd-dvd/sd-image-aarch64.nix> ];

  # Reduce bloat
  boot.supportedFilesystems = mkForce [ "vfat" ];
  # Adjustments to base image
  sdImage.firmwareSize = 32;
  boot.kernelPackages = mkForce (pkgs.linuxPackagesFor pkgs.linux_rpi_4_19);
  nixpkgs.overlays = [ (import ../overlays/partials/linux_rpi.nix) ];

  # Zsh shell
  environment.shells = [ "${pkgs.zsh}/bin/zsh" ];
  programs.zsh.enable = true;
  programs.zsh.interactiveShellInit = ''
    setopt histignorespace
  '';
  programs.zsh.ohMyZsh = {
    enable = true;
    customPkgs = [ pkgs.spaceship-prompt ];
    theme = "spaceship";
  };

  # SSH configuration for headless deployment
  networking.hostName = "aarch64";
  systemd.services.sshd.wantedBy = mkForce [ "multi-user.target" ];

  users.mutableUsers = false;
  users.defaultUserShell = "${pkgs.zsh}/bin/zsh";
  users.users.root.openssh.authorizedKeys.keyFiles =
    optional (builtins.pathExists ../credentials/aarch64.pub) ../credentials/aarch64.pub;

  services.avahi = {
    enable = true;
    nssmdns = true;
    publish.enable = true;
    publish.addresses = true;
  };

  # Pin system in the event of a cross compilation
  nixpkgs = {
    config = {};
    localSystem = { system = builtins.currentSystem; };
  };
}
