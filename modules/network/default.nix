{ config, pkgs, ... }:

let
  settings = import ../../settings.nix;
in with settings; {
  imports =
    [
      ./kresd.nix
      ./openvpn.nix
    ];

  networking = {
    hostName = hostname;

    nameservers = [
      "127.0.0.1"
    ];

    networkmanager = {
      enable = true;
    };
  };
}
