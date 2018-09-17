{ config, pkgs, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
  ];

  environment = {
    interactiveShellInit = ''
      alias emacs="${pkgs.emacs}/bin/emacs --no-window-system"
    '';

    systemPackages = with pkgs; [
      emacs
    ];
  };

  hardware = {
    enableRedistributableFirmware = true;
  };

  i18n = {
    consoleFont = "latarcyrheb-sun32";
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
