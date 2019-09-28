{ pkgs, ... }:

{
  imports =
    [
      ./kvm-support.nix
      ./hardened.nix
      ./libvirtd.nix
      ./networkd.nix
    ];

  boot.cleanTmpDir = true;
  boot.kernelPackages = pkgs.rpi3Packages_4_19;
  boot.kernelParams = [
    "cma=32M"
    "console=tty0"
    "console=ttyS0,115200n8"

    # deadline I/O scheduler
    "elevator=deadline"
  ];
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
    nixpkgs-fmt
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
      (
        self: super: {
          nixopsUnstable = (
            import "${builtins.fetchGit {
              url = "https://git.sr.ht/~eadwu/nixops";
              rev = "e8f8d012a6b9ed51d067eb5ae34f26e91c2c0e51";
              ref = "libvirtd/support-aarch64-linux";
            }}/release.nix" {}
          ).build.aarch64-linux;
        }
      )

      (
        self: super: with self.pkgs; rec {
          linux_rpi3_4_19 = (
            super.linux_rpi3.override {
              argsOverride = rec {
                version = "4.19.75";
                modDirVersion = with lib; concatStrings (intersperse "." (take 3 (splitString "." "${version}.0")));
              };
            }
          ).overrideDerivation (
            oldAttrs: {
              src = builtins.fetchTarball {
                url = "https://github.com/raspberrypi/linux/archive/6d8bf28fa4b1ca0a35c0cd1dcb267fb216daf720.tar.gz";
              };

              nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ [
                flex
                bison
              ];
            }
          );

          linux_rpi3_4_19_hardened = linux_rpi3_4_19.override {
            argsOverride.modDirVersion = linux_rpi3_4_19.modDirVersion + "-hardened";
          };

          rpi3Packages_4_19 = self.pkgs.linuxPackagesFor linux_rpi3_4_19;
          rpi3Packages_4_19_hardened = self.pkgs.hardenedLinuxPackagesFor linux_rpi3_4_19_hardened;

          raspberrypifw = super.raspberrypifw.overrideAttrs (
            _: {
              src = builtins.fetchTarball {
                url = "https://github.com/raspberrypi/firmware/archive/f5c626c64874d6e1482edf4a76aa22e5e54be63d.tar.gz";
              };
            }
          );
        }
      )
    ];
  };

  networking = {
    hostName = "divus";
    enableIPv6 = false;

    wireless = {
      enable = true;
      driver = "wext,nl80211";

      networks.eduroam.auth = ''
        eap=PEAP
        auth_alg=OPEN
        key_mgmt=WPA-EAP
        proto=WPA RSN
        pairwise=CCMP
        group=CCMP TKIP
        identity="edmundwu@buffalo.edu"
        anonymous_identity="notastudentatbuffalo@buffalo.edu"
        password=hash:${builtins.readFile /etc/wpa_supplicant/eduroam}
        phase1="peaplabel=0"
        phase2="auth=MSCHAPV2"
      '';
    };
  };

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
    {
      device = "/swp";
      size = 4096;
    }
  ];

  services.avahi = {
    enable = true;
    nssmdns = true;
    publish.enable = true;
    publish.addresses = true;
  };

  services.fail2ban = {
    enable = true;
    jails.DEFAULT = ''
      blocktype = DROP
    '';

    # 4 failed logins over 12 hours before blocking the IP for a day
    jails.sshd = ''
      enabled = true
      port = ssh
      logpath = %(sshd_log)s
      backend = %(sshd_backend)s
      banaction = iptables-multiport

      maxretry = 4
      findtime = 43200
      bantime = 86400
    '';

    # 35 failed logins over 3 days before blocking the IP for a week
    jails.sshdgank = ''
      enabled = true
      port = ssh
      logpath = %(sshd_log)s
      backend = %(sshd_backend)s
      banaction = iptables-multiport

      filter = sshd
      maxretry = 35
      findtime = 259200
      bantime = 608400
    '';
  };

  services.irqbalance.enable = true;

  services.openssh = {
    enable = true;
    permitRootLogin = "yes";
  };

  system = {
    stateVersion = "20.03";

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
}
