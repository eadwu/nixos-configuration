{ config, ... }:

with config.nixos; {
  imports =
    [
      ./kresd.nix
    ];

  networking = {
    hostName = settings.machine.hostname;

    wireless = {
      iwd = {
        enable = true;
      };
    };
  };
}
