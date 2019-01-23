{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.networking.wireguard;
  kernel = config.boot.kernelPackages;

  interfaceOpts = { ... }: {
    options = {
      blacklist = mkOption {
        default = [];
        example = [ "enp0s*" "lo" ];
        type = with types; listOf str;
        description = ''
          Network interfaces never to be included in the netns. This is a local blacklist on the
          current interfaces.
        '';
      };

      whitelist = mkOption {
        default = [];
        example = [ "enp0s*" "lo" ];
        type = with types; listOf str;
        description = ''
          Network interfaces to always be included in the netns. This is a local whitelist on the
          current interfaces.
        '';
      };

      ips = mkOption {
        default = [];
        example = [ "192.168.2.1/24" ];
        type = with types; listOf str;
        description = ''
          The IP addresses of the interface.
        '';
      };

      privateKey = mkOption {
        default = null;
        example = "yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk=";
        type = with types; nullOr str;
        description = ''
          Base64 private key generated by wg genkey.

          Warning: Consider using privateKeyFile instead if you do not
          want to store the key in the world-readable Nix store.
        '';
      };

      privateKeyFile = mkOption {
        default = null;
        example = "/private/wireguard_key";
        type = with types; nullOr str;
        description = ''
          Private key file as generated by wg genkey.
        '';
      };

      listenPort = mkOption {
        default = null;
        example = 51820;
        type = with types; nullOr int;
        description = ''
          16-bit port for listening. Optional; if not specified,
          automatically generated based on interface name.
        '';
      };

      preSetup = mkOption {
        default = "";
        example = literalExample ''
          ${pkgs.iproute}/bin/ip netns add foo
        '';
        type = with types; coercedTo (listOf str) (concatStringsSep "\n") lines;
        description = ''
          Commands called at the start of the interface setup.
        '';
      };

      postSetup = mkOption {
        default = "";
        example = literalExample ''
          printf "nameserver 10.200.100.1" | ${pkgs.openresolv}/bin/resolvconf -a wg0 -m 0
        '';
        type = with types; coercedTo (listOf str) (concatStringsSep "\n") lines;
        description = ''
          Commands called at the end of the interface setup.
        '';
      };

      postShutdown = mkOption {
        default = "";
        example = literalExample "${pkgs.openresolv}/bin/resolvconf -d wg0";
        type = with types; coercedTo (listOf str) (concatStringsSep "\n") lines;
        description = ''
          Commands called after shutting down the interface.
        '';
      };

      table = mkOption {
        default = "main";
        type = types.str;
        description = ''
          The kernel routing table to add this interface's associated routes to.
          Setting this is useful for e.g. policy routing ("ip rule") or virtual
          routing and forwarding ("ip vrf"). Both numeric table IDs and table
          names (/etc/rt_tables) can be used. Defaults to "main".
        '';
      };

      peers = mkOption {
        default = [];
        type = with types; listOf (submodule peerOpts);
        description = ''
          Peers linked to the interface.
        '';
      };

      allowedIPsAsRoutes = mkOption {
        default = true;
        example = false;
        type = types.bool;
        description = ''
          Determines whether to add allowed IPs as routes or not.
        '';
      };
    };
  };

  peerOpts = {
    options = {
      publicKey = mkOption {
        example = "xTIBA5rboUvnH4htodjb6e697QjLERt1NAB4mZqp8Dg=";
        type = types.str;
        description = ''
          The base64 public key the peer.
        '';
      };

      presharedKey = mkOption {
        default = null;
        example = "rVXs/Ni9tu3oDBLS4hOyAUAa1qTWVA3loR8eL20os3I=";
        type = with types; nullOr str;
        description = ''
          Base64 preshared key generated by wg genpsk. Optional,
          and may be omitted. This option adds an additional layer of
          symmetric-key cryptography to be mixed into the already existing
          public-key cryptography, for post-quantum resistance.

          Warning: Consider using presharedKeyFile instead if you do not
          want to store the key in the world-readable Nix store.
        '';
      };

      presharedKeyFile = mkOption {
        default = null;
        example = "/private/wireguard_psk";
        type = with types; nullOr str;
        description = ''
          File pointing to preshared key as generated by wg pensk. Optional,
          and may be omitted. This option adds an additional layer of
          symmetric-key cryptography to be mixed into the already existing
          public-key cryptography, for post-quantum resistance.
        '';
      };

      endpoint = mkOption {
        default = null;
        example = "demo.wireguard.io:12913";
        type = with types; nullOr str;
        description = ''
          Endpoint IP or hostname of the peer, followed by a colon, and then a
          port number of the peer.
        '';
      };

      persistentKeepalive = mkOption {
        default = null;
        type = with types; nullOr int;
        example = 25;
        description = ''
          This is optional and is by default off, because most users will not
          need it. It represents, in seconds, between 1 and 65535 inclusive, how
          often to send an authenticated empty packet to the peer, for the
          purpose of keeping a stateful firewall or NAT mapping valid
          persistently. For example, if the interface very rarely sends traffic,
          but it might at anytime receive traffic from a peer, and it is behind
          NAT, the interface might benefit from having a persistent keepalive
          interval of 25 seconds; however, most users will not need this.
        '';
      };

      allowedIPs = mkOption {
        example = [ "10.192.122.3/32" "10.192.124.1/24" ];
        type = with types; listOf str;
        description = ''
          List of IP (v4 or v6) addresses with CIDR masks from which this peer
          is allowed to send incoming traffic and to which outgoing traffic for
          this peer is directed. The catch-all 0.0.0.0/0 may be specified for
          matching all IPv4 addresses, and ::/0 may be specified for matching
          all IPv6 addresses.
        '';
      };
    };
  };

  generateUnit = name: values:
    assert (values.privateKey != null) != (values.privateKeyFile != null);
    let
      privateKey = if values.privateKeyFile != null
        then values.privateKeyFile
        else pkgs.writeText "${name}-key" values.privateKey;
    in nameValuePair "wireguard-${name}" {
      after = [ "network.target" "network-online.target" "wireguard-netns.service" ];
      bindsTo = [ "wireguard-netns.service" ];
      requires = [ "network-online.target" "wireguard-netns.service" ];
      wantedBy = [ "multi-user.target" ];

      description = "WireGuard Tunnel - ${name}";
      environment = {
        BLACKLIST = toString (cfg.blacklist ++ values.blacklist);
        WHITELIST = toString (cfg.whitelist ++ values.whitelist);
      };
      path = with pkgs; [ iw kmod iproute systemd wireguard ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };

      script = ''
        ${optionalString (!config.boot.isContainer) "modprobe wireguard"}

        ${values.preSetup}

        ip -n ${cfg.namespace} link add dev ${name} type wireguard
        ip -n ${cfg.namespace} link set ${name} netns 1

        ${concatMapStringsSep "\n" (ip:
          "ip address add ${ip} dev ${name}"
        ) values.ips}

        wg set ${name} \
          private-key ${privateKey} \
          ${optionalString (values.listenPort != null) " listen-port ${toString values.listenPort}"}

        ${concatMapStringsSep "\n" (peer:
          assert (peer.presharedKeyFile == null) || (peer.presharedKey == null);
          let
            psk = if peer.presharedKey != null
              then pkgs.writeText "${name}-psk" peer.presharedKey
              else peer.presharedKeyFile;
          in ''
            wg set ${name} \
              peer ${peer.publicKey} \
              ${optionalString (psk != null) "preshared-key ${psk}"} \
              ${optionalString (peer.endpoint != null) "endpoint ${peer.endpoint}"} \
              ${optionalString (peer.persistentKeepalive != null) "persistent-keepalive ${toString peer.persistentKeepalive}"} \
              ${optionalString (peer.allowedIPs != []) "allowed-ips ${concatStringsSep "," peer.allowedIPs}"}
          ''
        ) values.peers}

        # TODO: Ethernet support
        # ip link set eth0 netns ${cfg.namespace}
        iw phy phy0 set netns name ${cfg.namespace}

        ip link set up dev ${name}
        ip route add default dev ${name}

        ${values.postSetup}
      '';

      postStop = ''
        # ip -n ${cfg.namespace} link set eth0 down
        # ip -n ${cfg.namespace} link set wlan down

        # ip -n ${cfg.namespace} link set eth0 netns 1
        ip netns exec ${cfg.namespace} iw phy phy0 set netns 1
        ip link del ${name}

        ${values.postShutdown}
      '';
    };
in {
  options = {
    networking.wireguard = {
      enable = mkOption {
        default = cfg.interfaces != { };
        type = types.bool;
        description = ''
          Whether or not to activate the WireGuard configuration.
        '';
      };

      namespace = mkOption {
        default = "physical";
        type = types.str;
        description = ''
          Name of the network namespace to create.
        '';
      };

      blacklist = mkOption {
        default = [];
        example = [ "enp0s*" "lo" ];
        type = with types; listOf str;
        description = ''
          Network interfaces never to be included in the netns. This is a global blacklist across
          all interfaces.
        '';
      };

      whitelist = mkOption {
        default = [];
        example = [ "enp0s*" "lo" ];
        type = with types; listOf str;
        description = ''
          Network interfaces to always be included in the netns. This is a global whitelist across
          all interfaces.
        '';
      };

      interfaces = mkOption {
        default = {};
        example = {
          wg0 = {
            ips = [ "192.168.20.4/24" ];
            privateKey = "yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk=";
            peers = [
              { allowedIPs = [ "192.168.20.1/32" ];
                publicKey  = "xTIBA5rboUvnH4htodjb6e697QjLERt1NAB4mZqp8Dg=";
                endpoint   = "demo.wireguard.io:12913"; }
            ];
          };
        };
        type = with types; attrsOf (submodule interfaceOpts);
        description = ''
          Wireguard interfaces.
        '';
      };
    };
  };

  config = mkIf (cfg.enable) {
    boot.extraModulePackages = [ kernel.wireguard ];
    environment.systemPackages = [ pkgs.wireguard-tools ];

    systemd.services = let
      netns = { serviceConfig.PrivateNetwork = true; };
      netnsDepend = netns // { unitConfig.JoinsNamespaceOf = "wireguard-netns.service"; };
    in mapAttrs' generateUnit cfg.interfaces // {
      dhcpcd = netnsDepend;
      wpa_supplicant = netnsDepend;

      wireguard-netns = {
        description = "WireGuard Network Namespace - ${cfg.namespace}";
        documentation = [ "https://github.com/systemd/systemd/issues/2741#issuecomment-433979748"
                          "https://paste.gnugen.ch/raw/LmAV"
                          "https://paste.gnugen.ch/raw/Dpdz" ];
        path = with pkgs; [ iproute utillinux ];
        unitConfig.StopWhenUnneeded = true;
        serviceConfig = netns.serviceConfig // {
          Type = "oneshot";
          RemainAfterExit = true;
        };

        script = ''
          ip netns add ${cfg.namespace}
          umount /var/run/netns/${cfg.namespace}
          mount --bind /proc/self/ns/net /var/run/netns/${cfg.namespace}
        '';

        postStop = ''
          ip netns del ${cfg.namespace}
        '';
      };
    };
  };
}
