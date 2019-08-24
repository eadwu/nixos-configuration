{ pkgs, lib, ... }:

{
  boot.kernelPatches = [
    {
      name = "rpi-base-extend";
      patch = null;
      extraConfig = ''
        # enable basic KVM support; see e.g.
        # https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=210546&start=25#p1300453
        VIRTUALIZATION y
        KVM y
        VHOST_NET m
        VHOST_CROSS_ENDIAN_LEGACY y

        # enable ZSWAP support for better performance during large builds etc.
        # requires activation via kernel parameter or sysfs
        # see e.g. https://askubuntu.com/a/472227 for a summary of ZSWAP (vs ZRAM etc.)
        # and e.g. https://wiki.archlinux.org/index.php/zswap for parameters etc.
        ZPOOL y
        ZSWAP y
        ZBUD y
        Z3FOLD y
        ZSMALLOC y
        PGTABLE_MAPPING y

        # https://groups.google.com/forum/#!topic/linux.gentoo.user/_2aSc_ztGpA
        # https://github.com/torvalds/linux/blob/master/init/Kconfig#L848
        # Enables BPF syscall for systemd-journald firewalling
        BPF_SYSCALL y
        CGROUP_BPF y

        #See https://github.com/raspberrypi/linux/issues/2177#issuecomment-354647406
        # Netfilter kernel support
        # xtables
        NETFILTER_XTABLES m
        # Netfilter nf_tables support
        NF_TABLES m
        NETFILTER_XTABLES m
        NF_TABLES_BRIDGE m
        NF_NAT_SIP m
        NF_NAT_TFTP m
        NF_NAT_REDIRECT m
        NF_TABLES_INET m
        NF_TABLES_NETDEV m
        NF_TABLES_ARP m
        NF_DUP_IPV4 m
        NF_LOG_IPV4 m
        NF_REJECT_IPV4 m
        NF_NAT_IPV4 m
        NF_DUP_NETDEV m
        NF_DEFRAG_IPV4 m
        NF_CONNTRACK_IPV4 m
        NF_TABLES_IPV4 m
        NF_NAT_MASQUERADE_IPV4 m
        NF_NAT_SNMP_BASIC m
        NF_NAT_PROTO_GRE m
        NF_NAT_PPTP m
        NF_DEFRAG_IPV6 m
        NF_CONNTRACK_IPV6 m
        NF_TABLES_IPV6 m
        NF_DUP_IPV6 m
        NF_REJECT_IPV6 m
        NF_LOG_IPV6 m
        NF_NAT_IPV6 m
        NF_NAT_MASQUERADE_IPV6 m
        NFT_EXTHDR m
        NFT_META m
        NFT_NUMGEN m
        NFT_CT m
        NFT_SET_RBTREE m
        NFT_SET_HASH m
        NFT_COUNTER m
        NFT_LOG m
        NFT_LIMIT m
        NFT_MASQ m
        NFT_REDIR m
        NFT_NAT m
        NFT_QUEUE m
        NFT_QUOTA m
        NFT_REJECT m
        NFT_REJECT_INET m
        NFT_COMPAT m
        NFT_HASH m
        NFT_DUP_NETDEV m
        NFT_FWD_NETDEV m
        NFT_CHAIN_ROUTE_IPV4 m
        NFT_REJECT_IPV4 m
        NFT_DUP_IPV4 m
        NFT_CHAIN_NAT_IPV4 m
        NFT_MASQ_IPV4 m
        NFT_REDIR_IPV4 m
        NFT_CHAIN_ROUTE_IPV6 m
        NFT_REJECT_IPV6 m
        NFT_DUP_IPV6 m
        NFT_CHAIN_NAT_IPV6 m
        NFT_MASQ_IPV6 m
        NFT_REDIR_IPV6 m
        NFT_BRIDGE_META m
        NFT_BRIDGE_REJECT m
        IP_SET_BITMAP_IPMAC m
        IP_SET_BITMAP_PORT m
        IP_SET_HASH_IP m
        IP_SET_HASH_IPMARK m
        IP_SET_HASH_IPPORT m
        IP_SET_HASH_IPPORTIP m
        IP_SET_HASH_IPPORTNET m
        IP_SET_HASH_MAC m
        IP_SET_HASH_NETPORTNET m
        IP_SET_HASH_NET m
        IP_SET_HASH_NETNET m
        IP_SET_HASH_NETPORT m
        IP_SET_HASH_NETIFACE m
        IP_SET_LIST_SET m
        IP6_NF_IPTABLES m
        IP6_NF_MATCH_AH m
        IP6_NF_MATCH_EUI64 m
        IP6_NF_NAT m
        IP6_NF_TARGET_MASQUERADE m
        IP6_NF_TARGET_NPT m
        NF_LOG_BRIDGE m
        BRIDGE_NF_EBTABLES m
        BRIDGE_EBT_BROUTE m
        BRIDGE_EBT_T_FILTER m

        # Enable VLAN support again (its in armv7 configs)
        IPVLAN m

        # Enable per-interface network priority control
        # (for systemd-nspawn)
        CGROUP_NET_PRIO y
      '';
    }
  ];

  boot.cleanTmpDir = true;
  boot.loader.grub.enable = false;
  boot.loader.raspberryPi = {
    enable = true;
    version = 3;
    firmwareConfig = ''
      # boot_delay=1
      # force_turbo=1
      gpu_mem=64
    '';
  };
  boot.loader.raspberryPi.uboot = {
    enable = true;
    configurationLimit = 4;
  };

  environment.shells = [ "${pkgs.zsh}/bin/zsh" ];
  environment.systemPackages = with pkgs; [
    # Raspberry Pi specific
    raspberrypi-tools

    fzf
    gptfdisk
    htop
    libarchive
    openssl
    nixopsUnstable
    nix-index
    pass
    ripgrep
    tree
    unrar
    unzip
    vim
    wget
    zip
    # Version Control
    git

    # Debug / Utils
    lsof
    blktrace
    iotop
    nix-universal-prefetch
    pciutils
    usbutils
  ];
  environment.variables = {
    EDITOR = "vim";
    VISUAL = "vim";
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
  };

  hardware.enableRedistributableFirmware = true;

  nix = {
    autoOptimiseStore = true;
    buildCores = 0;
    distributedBuilds = true;
    package = pkgs.nixUnstable;
    requireSignedBinaryCaches = true;
    useSandbox = true;
    trustedUsers = [ "root" ];

    binaryCaches = [
      "https://rpi.cachix.org/"
    ];

    binaryCachePublicKeys = [
      "rpi.cachix.org-1:Rfb3+jN/+LcMvuTkGFkB9uTkRcNUq97AGSFxF1wMPDU="
    ];

    extraOptions = ''
      show-trace = true
      allow-import-from-derivation = false
    '';

    gc = {
      automatic = true;
      dates = "03:00";
      options = "--delete-older-than 7d";
    };

    nixPath = [
      "/etc/nixos"
      "nixos-config=${builtins.toString ./.}"
      "nixpkgs=https://git.sr.ht/~eadwu/nixpkgs/archive/develop.tar.gz"
    ];
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (self: super: {
        nixopsUnstable = super.nixopsUnstable.overrideAttrs(_: {
          version = "latest";

          src = builtins.fetchTarball {
            url = "https://hydra.nixos.org/job/nixops/master/tarball/latest/download-by-type/file/source-dist";
          };
        });

        linux_rpi_4_19 = (super.linux_rpi.override {
          argsOverride = rec {
            version = "4.19.66";
            modDirVersion = with lib; concatStrings (intersperse "." (take 3 (splitString "." "${version}.0")));
          };
        }).overrideDerivation (_: {
          src = builtins.fetchTarball {
            url = "https://github.com/raspberrypi/linux/archive/fc5826fb999e0b32900d1f487e90c27a92010214.tar.gz";
          };
        });

        raspberrypifw = super.raspberrypifw.overrideAttrs (_: {
          src = builtins.fetchTarball {
            url = "https://github.com/raspberrypi/firmware/archive/b42496fd290dbe8cea47b230eb1782641329a24d.tar.gz";
          };
        });
      })
    ];
  };

  networking.hostName = "divus";

  programs.zsh = {
    enable = true;
    interactiveShellInit = ''
      setopt histignorespace

      nix-clean () {
        nix-env --delete-generations old
        nix-store --gc
        nix-channel --update
        nix-env -u --always
        for link in /nix/var/nix/gcroots/auto/*; do rm $(readlink "$link"); done
        nix-collect-garbage -d
      }

      nix-derive-output () {
        nix-store --query --requisites --include-outputs $(nix-store --query --deriver "$1")
      }
    '';

    ohMyZsh = {
      enable = true;
      customPkgs = with pkgs; [ spaceship-prompt ];
      theme = "spaceship";
    };
  };

  swapDevices = [
    { device = "/swp";
      size = 4096; }
  ];

  services.avahi = {
    enable = true;
    nssmdns = true;
    publish.enable = true;
    publish.addresses = true;
  };

  services.openssh = {
    enable = true;
    permitRootLogin = "yes";
  };

  system = {
    stateVersion = "19.03";

    autoUpgrade = {
      enable = false;
      channel = "https://nixos.org/channels/nixpkgs-unstable";
    };
  };

  time.timeZone = "America/New_York";

  users = {
    mutableUsers = false;
    defaultUserShell = "${pkgs.zsh}/bin/zsh";
    users.root.hashedPassword = "$6$x22p1m/bQ7/C3Xwj$kS6OR/q5iGng96vghvPMMlDTij32Jp1.8DyCrH4qFRWThHwrxYjIimW6uP4DcIDyJMT4/ZfNPCWz1X.t0dSOP.";
  };

  # linux-hardened
  # imports =
  #   [
  #     <nixpkgs/nixos/modules/profiles/hardened.nix>
  #   ];

  boot.kernelPackages = pkgs.hardenedLinuxPackagesFor pkgs.linux_rpi_4_19;

  boot.kernelParams = [
    "cma=32M" "console=tty0" "console=ttyS0,115200n8"

    # deadline I/O scheduler
    "elevator=deadline"
  ];

  environment.memoryAllocator.provider = "libc";

  security.allowUserNamespaces = true;
  security.allowSimultaneousMultithreading = true;

  # systemd-networkd
  networking = {
    dhcpcd.enable = false;

    wireless = {
      enable = true;

      networks.eduroam.auth = ''
        eap=PEAP
          auth_alg=OPEN
          key_mgmt=WPA-EAP
          proto=WPA RSN
        pairwise=CCMP
        group=CCMP TKIP
          identity="edmundwu@buffalo.edu"
          anonymous_identity="notastudentatbuffalo@buffalo.edu"
          password=hash:${builtins.readFile /etc/eduroam}
          ca_cert="${builtins.toString /etc/ca.pem}"
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
      dns = [ "1.1.1.1" "9.9.9.9" ];

      matchConfig.Name = "!docker0* virbr0*";

      dhcpConfig = {
        Anonymize = true;
        UseDNS = true;
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

  # libvirtd
  virtualisation.libvirtd.enable = true;
  networking.firewall.checkReversePath = false;

  systemd.services.qemu-libvirtd-init = {
    after = [ "libvirtd.service" ];
    requires = [ "libvirtd.service" ];
    wantedBy = [ "libvirtd.service" ];

    path = [ pkgs.libvirt ];
    description = "QEMU libvirt default storage pool";
    serviceConfig = {
      Type = "oneshot";
      Restart = "no";
    };

    script = ''
      # No active storage pool called default
      if ! virsh pool-list --name | grep -q default; then
        # Yet the pool exists?! Heresy!
        if virsh pool-list --all | grep -q default; then
          virsh pool-delete default
          virsh pool-undefine default
        fi

        # Rereate images directory if needed
        if [ ! -d /var/lib/libvirt/images ]; then
          mkdir /var/lib/libvirt/images
          chgrp libvirtd /var/lib/libvirt/images
          chmod g+w /var/lib/libvirt/images
        fi

        virsh pool-define-as default dir --target /var/lib/libvirt/images
        virsh pool-autostart default
        virsh pool-start default
      fi
    '';
  };
}
