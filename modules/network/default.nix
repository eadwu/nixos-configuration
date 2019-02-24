{ config, ... }:

with config.nixos; {
  imports =
    [
      ./kresd.nix
    ];

  networking = {
    hostName = settings.machine.hostname;
    firewall.checkReversePath = false;
    wireless.iwd.enable = true;
  };
}
