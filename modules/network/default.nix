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
    linkConfig = interface: {
      matchConfig = {
        OriginalName = "${interface}*";
      };

      linkConfig = {
        MACAddressPolicy = "random";
        NamePolicy = "kernel database onboard slot path";
      };
    };

    networkConfig = interface: {
      name = "${interface}*";
      DHCP = "yes";
      dns = [ "127.0.0.1" ];

      dhcpConfig = {
        Anonymize = true;
        UseDNS = false;
      };
    };
  in {
    enable = true;
    links = builtins.listToAttrs (map (interface: { name = interface; value = linkConfig interface; }) [ "en" "wl" ]);
    networks = builtins.listToAttrs (map (interface: { name = interface; value = networkConfig interface; }) [ "en" "wl" ]);
  };
}
