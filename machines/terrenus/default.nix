{ nixosModules, config, pkgs, lib, ... }:

with config.nixos; {
  imports =
    [
      ./hardware-configuration.nix

      ../../profiles/desktop.nix

      ../../hardware/dell/9570.nix
      ../../hardware/gpu/nvidia/disable
      # ../../hardware/gpu/nvidia/offload
      # ../../hardware/gpu/nvidia/sync

      ../../hardware/profiles/yubikey.nix

      nixosModules.impermanence
    ];

  # boot.kernelPackages = lib.mkForce pkgs.linuxPackages;

  documentation.enable = false;
  # documentation.info.enable = false;

  programs.fuse.userAllowOther = true;

  environment.systemPackages =
    with pkgs;
    [
      # Imperial
      imperial
      bindfs
      mergerfs mergerfs-tools
      unionfs-fuse fuse-overlayfs
    ];

  # boot.plymouth.enable = true;

  networking.whitelist = [
    # weather.com videos
    "^v.w-x.co$"
    # UB Box, buffalo.app.box.com
    "^app.box.com$"
    # Akuna Capital
    "^greenhouse.io$"
    "^boards.greenhouse.io$"
    # Wattpad
    "^www.wattpad.com$"
    # yeet
    "^files.catbox.moe$"
    # "^groups.csail.mit.edu$"
    "^aditsachde.com$"
    "^.*.mathworks.com.*$"
    # Imgur
    "^t.imgur.com$"

    "^.*.homedepot.com.*$"
    "^www.lemonade.com$"
    "^.*.alaskaair.com.*$"

    # Job Applications
    "^account.amazon.jobs$"
    "^qualtrics.com$"
    "^salesforce.com$"
    "^uhf.microsoft.com$"
    "^careers.tiktok.com$"
  ];

  # environment.etc."systemd/stalld.conf".source = pkgs.stalld + "/etc/systemd/stalld.conf";
  # systemd.services."stalld" = {
  #   wantedBy = [ "multi-user.target" ];

  #   description = "Stall Monitor";

  #   serviceConfig = {
  #     Type = "forking";
  #     EnvironmentFile = "/etc/systemd/stalld.conf";
  #     ExecStart = "${pkgs.stalld}/bin/stalld $CLIST $AGGR $BP $BR $BD $THRESH $LOGGING $FG $PF";
  #   };
  # };

  # specialisation.wireguard = {
  #   inheritParentConfig = true;
  #   configuration.imports = [ ../../modules/network/wireguard.nix ];
  # };

  # specialisation.openvpn = {
  #   inheritParentConfig = true;
  #   configuration.imports = [ ../../modules/network/openvpn.nix ];
  # };

  networking.firewall.allowPing = false;

  boot.kernelModules = [ "zram" ];
  services.udev.extraRules = ''
    KERNEL=="zram0", SUBSYSTEM=="block", DRIVER=="", ACTION=="add", ATTR{disksize}=="0", ATTR{comp_algorithm}="zstd", ATTR{disksize}="16384M", RUN="${pkgs.util-linux}/sbin/mkswap /dev/zram0"
  '';
  swapDevices = [
    { device = "/dev/zram0"; priority = 5; }
  ];

  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.requestEncryptionCredentials = true;
  # head -c4 /dev/random | od -A none -t x4
  networking.hostId = "9852dcd9";
  services.zfs.autoSnapshot.enable = true;
  services.zfs.autoScrub.enable = true;
  # od -A n -t x8 -N 32 /dev/random | tr -d ' \n'
  boot.kernel.randstructSeed = "9f5cf1fa55b2006de3cef6d00a8481427ccc621bfa69c2c02795b954e0269535";

  boot.zfs.package = pkgs.zfs_unstable;
  boot.initrd.postDeviceCommands = lib.mkAfter ''
    zfs rollback -r rpool/local/root@blank
  '';

  environment.memoryAllocator.provider = "libc";

  environment.persistence."/persist" = {
    directories = [
      "/var/lib/alsa"
      "/var/lib/bluetooth"
      # "/var/lib/iwd"
    ];
    files = [ ];
  };
  systemd.tmpfiles.rules = [
    "d /persist                    0755 root root  -"
    "d /persist/home               2770 root users -"

    "d /persist/var/lib/alsa       0755 root root  -"
    "d /persist/var/lib/bluetooth  0755 root root  -"
    # "d /persist/var/lib/iwd        0700 root root  -"
  ];

  boot.kernelParams = [
    # 1024 * 1024 * 1024 * 8
    "zfs.zfs_arc_max=8589934592"

    "zram.num_devices=1"

    # General responsivity enhancement
    # "threadirqs"
    # "rcu_nocbs=0-11"

    ## https://rigtorp.se/low-latency-guide/
    # "isolcpus=nohz,domain,0-1" "transparent_hugepage=never"
  ];

  environment.variables.QT_AUTO_SCREEN_SCALE_FACTOR = toString settings.xserver.dpiScale;

  fonts.fontconfig.antialias = true;

  console = {
    font = "ter-u28n";
    packages = [ pkgs.terminus_font ];
  };

  nixos.settings = {
    system.user = "xps";
    machine.hostname = "terrenus";
    machine.screen.width = 3840;
    machine.screen.height = 2160;

    machine.cpu.tdp = {
      nominal = 30; # 35;
      up = 40; # 45;
    };

    machine.cpu.undervolt = rec {
      core = (-100);
      gpu = (-80);
      uncore = core;
      analogio = core;
    };

    xserver = {
      dpi = 193;
      dpiScale = 2;
      iccProfile = ../../hardware/display/9570/FNVDR-LQ156D1.icc;
    };
  };

  programs.zsh.interactiveShellInit = ''
    bios-upgrade () {
      ${pkgs.fwupd}/bin/fwupdmgr get-devices
      ${pkgs.fwupd}/bin/fwupdmgr get-updates
      ${pkgs.fwupd}/bin/fwupdmgr update
    }
  '';

  security.allowSimultaneousMultithreading = true;

  services = {
    kresd.instances = 2;

    xserver = {
      extraConfig = ''
        Section "InputClass"
          Identifier "SynPS/2 Synaptics TouchPad"
          MatchProduct "SynPS/2 Synaptics TouchPad"
          MatchIsTouchpad "on"
          MatchOS "Linux"
          MatchDevicePath "/dev/input/event*"
          Option "Ignore" "on"
        EndSection
      '';

      libinput.touchpad.additionalOptions = ''
        Option "AccelSpeed" "1"
      '';
    };
  };
}
