{ config, pkgs, ... }:

with config.nixos.custom; {
  imports =
    [
      ./kresd.nix
      ./openvpn.nix
    ];

  networking = {
    hostName = settings.nixos.hostname;

    nameservers = [
      "127.0.0.1"
    ];

    networkmanager = {
      enable = false;
      wifi = {
        backend = "iwd";
      };
    };

    wireless = {
      iwd = {
        enable = true;
      };
    };
  };
}
