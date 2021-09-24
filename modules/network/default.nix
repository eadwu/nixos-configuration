{ options, config, lib, ... }:

with config.nixos; {
  imports =
    [
      ./kresd.nix
      # ./openvpn.nix
    ];

  # University network configuration files
  systemd.tmpfiles.rules = [
    "C /var/lib/iwd/eduroam.8021x   - - - - ${./templates/eduroam.8021x}"
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

    timeServers = [
      # NIST
      "time.nist.gov"
      # Cloudflare
      "time.cloudflare.com"
    ] ++ options.networking.timeServers.default;
  };

  services.chrony.enable = true;
  services.chrony.servers = lib.mkForce [];
  # Needs DNS resolution
  systemd.services.chronyd.after = lib.optionals (config.services.kresd.enable) [ "kresd.target" ];
  systemd.services.chronyd.requires = lib.optionals (config.services.kresd.enable) [ "kresd.target" ];
  services.chrony.extraConfig = ''
    pool time.nist.gov iburst

    server time.cloudflare.com nts iburst

    pool nixos.pool.ntp.org iburst
    pool pool.ntp.org iburst
    pool amazon.pool.ntp.org iburst

    initstepslew ${toString config.services.chrony.initstepslew.threshold} ${lib.concatStringsSep " " config.networking.timeServers}

    # Enable kernel synchronization of the real-time clock (RTC).
    rtcsync

    ntsdumpdir /var/lib/chrony/nts
  '';

  services.resolved = {
    enable = false;
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
