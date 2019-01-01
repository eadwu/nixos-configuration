{ config, ... }:

with config.nixos.custom; {
  imports =
    [
      ./kresd.nix
    ];

  networking = {
    hostName = settings.nixos.hostname;

    wireless = {
      iwd = {
        enable = true;
      };
    };
  };
}
