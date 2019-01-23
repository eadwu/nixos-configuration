{ config, ... }:

with config.nixos; {
  imports =
    [
      ./kresd.nix
    ];

  networking = {
    hostName = settings.machine.hostname;
    firewall.checkReversePath = false;

    wireless = {
      enable = true;
      iwd.enable = false;
    };
  };
}
