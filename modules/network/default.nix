{ config, lib, ... }:

with config.nixos; {
  imports =
    [
      ./kresd.nix
      # ./openvpn.nix
    ];

  environment.etc."iwd/main.conf".text = lib.generators.toINI {} {
    General = {
      AddressRandomization = "once";
    };
  };

  networking = {
    hostName = settings.machine.hostname;
    enableIPv6 = false;
    dhcpcd.enable = lib.mkDefault false;
    wireless.iwd.enable = lib.mkDefault true;
  };

  services.resolved.extraConfig = ''
    MulticastDNS=false
  '';

  systemd.network = {
    enable = true;

    links.default = {
      matchConfig.OriginalName = "!docker0* virbr0*";

      linkConfig = {
        MACAddressPolicy = "random";
        NamePolicy = "kernel database onboard slot path";
      };
    };

    networks.default = {
      DHCP = "yes";
      dns = config.networking.nameservers
      # backup dns nameservers
      ++ [ "1.1.1.1" "9.9.9.9" ];

      matchConfig.Name = "!docker0* virbr0*";

      dhcpConfig = {
        Anonymize = true;
        UseDNS = false;
      };

      networkConfig = {
        DNSSEC = "no";
      };
    };

    networks = {
      eth = {
        matchConfig.Name = "eth* ens*";
        dhcpConfig.RouteMetric = 10;
      };

      wlan = {
        matchConfig.Type = "wlan";
        dhcpConfig.RouteMetric = 20;
      };

      tun = {
        matchConfig.Name = "tun*";
        linkConfig.Unmanaged = true;
      };
    };
  };
}
