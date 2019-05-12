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

  systemd.network = let
    linkConfig = netType: {
      matchConfig = {
        Type = netType;
      };

      linkConfig = {
        MACAddressPolicy = "random";
        NamePolicy = "kernel database onboard slot path";
      };
    };

    networkConfig = netType: {
      DHCP = "yes";
      dns = [ "127.0.0.1" ];

      matchConfig = {
        Type = netType;
      };

      dhcpConfig = {
        Anonymize = true;
        UseDNS = false;
      };
    };
  in {
    enable = true;
    links = builtins.listToAttrs (map (netType: { name = netType; value = linkConfig netType; }) [ "eth" "wlan" ]);
    networks = builtins.listToAttrs (map (netType: { name = netType; value = networkConfig netType; }) [ "eth" "wlan" ]);
  };
}
