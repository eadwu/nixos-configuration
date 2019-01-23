{ config, ... }:

with config.nixos; {
  imports =
    [
      ./kresd.nix
    ];

  networking = {
    hostName = settings.machine.hostname;

    wireless = {
        enable = true;
      iwd.enable = false;
    };
  };
}
