{ config, lib, ... }:

with config.nixos; {
  imports =
    [
      ./kresd.nix
    ];

  networking = {
    hostName = settings.machine.hostname;
    dhcpcd.enable = lib.mkDefault false;
    firewall.checkReversePath = false;
    wireless.iwd.enable = lib.mkDefault true;
  };

  services.resolved.extraConfig = ''
    MulticastDNS=false
  '';

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
      dns = config.networking.nameservers
        # backup dns nameservers
        ++ [ "1.1.1.1" "9.9.9.9" ];

      matchConfig = {
        Type = netType;
      };

      dhcpConfig = {
        Anonymize = true;
        UseDNS = false;
      };

      networkConfig = {
        DNSSEC = "no";
      };
    };
  in {
    enable = true;
    links = builtins.listToAttrs (map (netType: { name = netType; value = linkConfig netType; }) [ "eth" "wlan" ]);
    networks = builtins.listToAttrs (map (netType: { name = netType; value = networkConfig netType; }) [ "eth" "wlan" ]);
  };
}
