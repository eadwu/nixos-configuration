{ options, config, pkgs, lib, ... }:

{
  imports = [
    {
      # crypto modules for iwd
      boot.kernelModules = lib.optionals (config.networking.wireless.iwd.enable) [
        "algif_skcipher"
        "ecb"
        "cbc"
        "des_generic"
        "arc4"
      ];

      networking.wireless.iwd.enable = lib.mkDefault true;
      # https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=e10c6ada1203abe144830830f2314d1c9d870126
      networking.wireless.iwd.settings.General.AddressRandomization = "network";
    }

    {
      networking.timeServers = [
        # NIST
        "time.nist.gov"
        # Cloudflare
        "time.cloudflare.com"
      ] ++ options.networking.timeServers.default;

      services.chrony.enable = lib.mkDefault true;
      services.chrony.servers = lib.mkForce [ ];
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

      # Needs DNS resolution
      systemd.services.chronyd.wants = [ "network-online.target" ];
      systemd.services.chronyd.after = [ "network-online.target" "nss-lookup.target" ];
    }
  ];

  networking.enableIPv6 = true;
  networking.useNetworkd = true;
  networking.dhcpcd.enable = lib.mkDefault false;

  services.resolved.llmnr = "false";
  services.resolved.extraConfig = ''
    DNSOverTLS=opportunistic
  '';
  services.resolved.fallbackDns = lib.mkDefault [
    "2606:4700:4700::1111#cloudflare-dns.com"
    "2606:4700:4700::1001#cloudflare-dns.com"
    "1.1.1.1#cloudflare-dns.com"
    "1.0.0.1#cloudflare-dns.com"
  ];

  systemd.network.links.default = {
    matchConfig.OriginalName = "!docker* virbr* tun* cni* flannel* veth* tailscale*";

    linkConfig.MACAddressPolicy = "random";
  };

  # https://wiki.archlinux.org/title/Kubernetes#Pods_cannot_communicate_when_using_Flannel_CNI_and_systemd-networkd
  # TLDR: Let Flannel assign MAC address
  systemd.network.links.flannel = {
    matchConfig.OriginalName = "flannel*";
    linkConfig.MACAddressPolicy = "none";
  };

  systemd.network.networks.default = rec {
    DHCP = "yes";
    matchConfig.Name = "!docker* virbr* tun* cni* flannel* veth* wg* tailscale*";

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

  systemd.network.networks.eth = {
    matchConfig.Type = "ether";
    dhcpV4Config.RouteMetric = 10;
  };

  systemd.network.networks.wlan = {
    matchConfig.Type = "wlan";
    dhcpV4Config.RouteMetric = 20;
  };

  systemd.network.networks.docker = {
    matchConfig.Name = "docker*";
    linkConfig.Unmanaged = true;
  };

  systemd.network.networks.virbr = {
    matchConfig.Name = "virbr*";
    linkConfig.Unmanaged = true;
  };

  systemd.network.networks.tun = {
    matchConfig.Name = "tun*";
    linkConfig.Unmanaged = true;
  };

  systemd.network.networks.cni = {
    matchConfig.Name = "cni*";
    linkConfig.Unmanaged = true;
  };

  systemd.network.networks.flannel = {
    matchConfig.Name = "flannel*";
    linkConfig.Unmanaged = true;
  };

  systemd.network.networks.veth = {
    matchConfig.Name = "veth*";
    linkConfig.Unmanaged = true;
  };

  systemd.network.networks.tailscale = {
    matchConfig.Name = "tailscale*";
    linkConfig.Unmanaged = true;
  };
}
