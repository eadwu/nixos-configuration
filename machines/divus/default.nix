{ pkgs, ... }:

{
  imports =
    [
      # ./kvm-support.nix
      ./hardened.nix
      # ./libvirtd.nix
      ./networkd.nix
      ./wireless.nix
    ];

  boot.cleanTmpDir = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
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
    nix-prefetch-scripts
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

  nixpkgs.config.allowUnfree = true;

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
    {
      device = "/swp";
      size = 4096;
    }
  ];

  services.avahi = {
    enable = false;
    nssmdns = true;
    publish.enable = true;
    publish.addresses = true;
  };

  services.irqbalance.enable = true;

  services.openssh = {
    enable = true;
    passwordAuthentication = false;
  };

  system = {
    stateVersion = "19.08";

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
