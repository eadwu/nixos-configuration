{ config, ... }:

with config.nixos.custom; {
  imports =
    [
      ./kresd.nix
      ./openvpn.nix
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
