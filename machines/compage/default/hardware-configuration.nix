# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.loader.systemd-boot.enable = true;
  boot.initrd.luks.devices."cryptswap" = {
    bypassWorkqueues = true;
    gracePeriod = 0;
    device = "/dev/disk/by-uuid/5571a019-9326-46a4-b5eb-146ce772ae90";
  };
  boot.initrd.luks.devices."cryptfs" = {
    bypassWorkqueues = true;
    gracePeriod = 0;
    device = "/dev/disk/by-uuid/3ec97390-a378-40a6-9442-25a4dd196571";
  };

  fileSystems."/" =
    { device = "none";
      fsType = "tmpfs";
      options = [ "noatime" "nodiratime" ];
    };

  fileSystems."/cache" =
    { device = "rpool/ephemeral/cache";
      fsType = "zfs";
      neededForBoot = true;
    };

  fileSystems."/nix" =
    { device = "rpool/ephemeral/nix";
      fsType = "zfs";
      neededForBoot = true;
    };

  fileSystems."/persist" =
    { device = "rpool/subvolume/persist";
      fsType = "zfs";
      neededForBoot = true;
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/0ABD-D38A";
      fsType = "vfat";
    };

  swapDevices =
   [ { device = "/dev/disk/by-uuid/081f0261-6fa7-44cd-8f5a-214d06de4871"; }
   ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  # networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp166s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
