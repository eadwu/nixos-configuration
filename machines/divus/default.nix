{ pkgs, ... }:

{
  boot.cleanTmpDir = true;
  # boot.kernelPackages = pkgs.linuxPackagesFor pkgs.linux_rpi_4_19;
  # boot.kernelParams = [
  #   "cma=32M"
  #   "console=ttyS0,115200n8"

  #   # deadline I/O scheduler
  #   "elevator=deadline"
  # ];

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
    allowedUsers = [ "@wheel" ];

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
      })

      (self: super: with self.pkgs; {
        linux_rpi_4_19 = super.linux_rpi.override {
          argsOverride = rec {
            version = "4.19.65";
            modDirVersion = with lib; concatStrings (intersperse "." (take 3 (splitString "." "${version}.0")));

            src = builtins.fetchTarball {
              url = "https://github.com/raspberrypi/linux/archive/ea2c11a187c0e248343452846457b94715e04969.tar.gz";
            };
          };
        };

        raspberrypifw = super.raspberrypifw.overrideAttrs (_: {
          src = builtins.fetchTarball {
            url = "https://github.com/raspberrypi/firmware/archive/66bafab005569e3eb92ec54cd3efeee3da338738.tar.gz";
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

      nix-build-system () {
        nix build $@ \
          -f "<nixpkgs/nixos>" \
          config.system.build.toplevel
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
  imports =
    [
      <nixpkgs/nixos/modules/profiles/hardened.nix>
    ];

  boot.kernelPackages = pkgs.linuxPackages_latest_hardened;
  boot.blacklistedKernelModules = [
    # https://wiki.archlinux.org/index.php/Improving_performance#Watchdogs
    "iTCO_wdt"
  ];

  boot.kernelModules = [
    # Filesystem support
    "ext4"
    # Explicitly load these for usb read/write support
    "bfq" # Register io scheduler for usb
    "uas"
    "sd_mod"
    "usb_storage"
  ];

  boot.kernelParams = [
    "cma=32M"
    "console=ttyS0,115200n8"

    # deadline I/O scheduler
    "elevator=deadline"

    # https://wiki.archlinux.org/index.php/Power_management
    # Debugging feature to catch hardware hangs that cause a kernel panic
    # Disabling may cause decrease in power usage
    "snd_hda_intel.power_save=1"
    "vm.dirty_writeback_centisecs=6000"
  ];

  environment.memoryAllocator.provider = "libc";

  security.allowUserNamespaces = true;
  security.allowSimultaneousMultithreading = true;

  # systemd-networkd
  networking = {
    dhcpcd.enable = false;
    wireless.enable = true;
    # wireless.iwd.enable = true;
  };

  services.resolved.extraConfig = ''
    MulticastDNS=false
  '';

  systemd.network = {
    enable = true;

    links.default = {
      matchConfig.Name = "*";

      linkConfig = {
        MACAddressPolicy = "random";
        NamePolicy = "kernel database onboard slot path";
      };
    };

    networks.default = {
      DHCP = "yes";
      dns = [ "1.1.1.1" "9.9.9.9" ];

      matchConfig.Name = "*";

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
        matchConfig.Type = "eth";
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
