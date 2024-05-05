{ options, config, lib, ... }:

with config.nixos; {
  imports =
    [
      # ../../machines/caelus/modules/kresd.nix
      # ./openvpn.nix
    ];

  # University network configuration files
  systemd.tmpfiles.rules = lib.optionals (config.networking.wireless.iwd.enable) [
    "C /var/lib/iwd/eduroam.8021x    - - - - ${./templates/eduroam.8021x}"
    "C /var/lib/iwd/ATTXqKaTna.psk   - - - - ${./templates/ATTXqKaTna.psk}"
  ];

  boot.kernelModules = lib.optionals (config.networking.wireless.iwd.enable) [
    # iwd crypto modules
    "algif_skcipher"
    "ecb"
    "cbc"
    "des_generic"
    "arc4"
  ];

  # systemd.services.iwd.serviceConfig.Environment = "IWD_TLS_DEBUG=TRUE";

  networking = {
    hostName = lib.mkDefault settings.machine.hostname;
    enableIPv6 = true;
    useNetworkd = true;
    dhcpcd.enable = lib.mkDefault false;

    timeServers = [
      # NIST
      "time.nist.gov"
      # Cloudflare
      "time.cloudflare.com"
    ] ++ options.networking.timeServers.default;
  };

  networking.wireless.iwd = {
    enable = lib.mkDefault true;
    settings = {
      # https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=e10c6ada1203abe144830830f2314d1c9d870126
      General.AddressRandomization = "network";
    };
  };

  services.chrony.servers = lib.mkForce [];
  services.chrony.extraConfig = ''
    pool time.nist.gov iburst

    server time.cloudflare.com nts iburst

    pool nixos.pool.ntp.org iburst
    pool pool.ntp.org iburst
    pool amazon.pool.ntp.org iburst

    initstepslew ${toString config.services.chrony.initstepslew.threshold} ${lib.concatStringsSep " " config.networking.timeServers}

    # Enable kernel synchronization of the real-time clock (RTC).
    # rtcsync

    ntsdumpdir /var/lib/chrony/nts
  '';

  services.resolved = {
    llmnr = "false";  # "resolve"
    # dnssec = "allow-upgrade";
    extraConfig = ''
      DNSOverTLS=opportunistic
    '';
  #     MulticastDNS=resolve
  };

  systemd.network = {
    links.default = {
      matchConfig.OriginalName = "!docker* virbr* tun* cni* flannel* veth*";

      linkConfig = {
        MACAddressPolicy = "random";
        NamePolicy = "kernel database onboard slot path";
      };
    };

    links = {
      # https://wiki.archlinux.org/title/Kubernetes#Pods_cannot_communicate_when_using_Flannel_CNI_and_systemd-networkd
      # TLDR: Let Flannel assign MAC address
      flannel = {
        matchConfig.OriginalName = "flannel*";
        linkConfig.MACAddressPolicy = "none";
      };
    };

    networks.default = rec {
      DHCP = "yes";
      matchConfig.Name = "!docker* virbr* tun* cni* flannel* veth* wg*";

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

        # DNSSEC = "no";
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

      docker = {
        matchConfig.Name = "docker*";
        linkConfig.Unmanaged = true;
      };

      virbr = {
        matchConfig.Name = "virbr*";
        linkConfig.Unmanaged = true;
      };

      tun = {
        matchConfig.Name = "tun*";
        linkConfig.Unmanaged = true;
      };

      cni = {
        matchConfig.Name = "cni*";
        linkConfig.Unmanaged = true;
      };

      flannel = {
        matchConfig.Name = "flannel*";
        linkConfig.Unmanaged = true;
      };

      veth = {
        matchConfig.Name = "veth*";
        linkConfig.Unmanaged = true;
      };
    };
  };
}
