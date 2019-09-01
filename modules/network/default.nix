{ config, lib, ... }:

with config.nixos; {
  imports =
    [
      ./kresd.nix
    ];

  networking = {
    hostName = settings.machine.hostname;
    enableIPv6 = false;
    dhcpcd.enable = lib.mkDefault false;

    wireless = {
      enable = lib.mkDefault true;
      userControlled.enable = lib.mkDefault true;

      networks.eduroam.auth = ''
        eap=PEAP
        auth_alg=OPEN
        key_mgmt=WPA-EAP
        proto=WPA RSN
        pairwise=CCMP
        group=CCMP TKIP
        identity="edmundwu@buffalo.edu"
        anonymous_identity="notastudentatbuffalo@buffalo.edu"
        password=hash:${builtins.readFile ../../credentials/eduroam}
        phase1="peaplabel=0"
        phase2="auth=MSCHAPV2"
      '';
    };
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
    };
  };
}
