{ config, ... }:

with config.nixos; {
  imports =
    [
      ./kresd.nix
    ];

  networking = {
    hostName = settings.machine.hostname;
    dhcpcd.enable = false;
    firewall.checkReversePath = false;
    wireless.iwd.enable = true;
  };

  systemd.network = {
    enable = true;

    networks.wlpNs0 = {
      matchConfig = {
        Name = "wlp*s0";
      };

      networkConfig = {
        DHCP = "yes";
      };
    };
  };
}
