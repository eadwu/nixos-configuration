{ config, lib, ... }:

with config.nixos; {
  imports =
    [
      ./kresd.nix
      # ./openvpn.nix
    ];

  boot.kernelModules = [
    # iwd crypto modules
    "algif_skcipher"
    "ecb"
    "cbc"
    "des_generic"
    "arc4"
  ];

  environment.etc."iwd/main.conf".text = lib.generators.toINI {} {
    # https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=e10c6ada1203abe144830830f2314d1c9d870126
    General.AddressRandomization = "network";
  };

  networking = {
    hostName = settings.machine.hostname;
    enableIPv6 = true;
    dhcpcd.enable = lib.mkDefault false;
    wireless.iwd.enable = lib.mkDefault true;
  };

  services.resolved = {
    llmnr = "resolve";
    dnssec = "false";
    extraConfig = ''
      DNSOverTLS=opportunistic
      MulticastDNS=resolve
    '';
  };

  systemd.network = {
    enable = true;

    links.default = {
      matchConfig.OriginalName = "!docker0* virbr0*";

      linkConfig = {
        MACAddressPolicy = "random";
        NamePolicy = "kernel database onboard slot path";
      };
    };

    networks.default = rec {
      DHCP = "yes";
      dns = config.networking.nameservers
        ++ [ "2620:fe::fe" "9.9.9.9" ]
        ++ [ "2606:4700:4700::1111" "1.1.1.1" ]
        ;

      matchConfig.Name = "!docker* virbr* tun*";

      dhcpV4Config = {
        Anonymize = true;
        UseDNS = false;
      };

      dhcpV6Config = {
        inherit (dhcpV4Config) UseDNS;
      };

      networkConfig = {
        IPv6AcceptRA = true;
        IPv6PrivacyExtensions = "yes";
      };

      extraConfig = ''
        [IPv6AcceptRA]
        UseDNS=false
      '';
    };

    networks = {
      eth = {
        matchConfig.Name = "eth* ens*";
        dhcpV4Config.RouteMetric = 10;
      };

      wlan = {
        matchConfig.Type = "wlan";
        dhcpV4Config.RouteMetric = 20;
      };

      tun = {
        matchConfig.Name = "tun*";
        linkConfig.Unmanaged = true;
      };
    };
  };
}
