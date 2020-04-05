{ flakes, config, lib, pkgs, ... }:

{
  imports =
    [ (flakes.nixpkgs.path + "/nixos/modules/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" "bcache" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/mapper/cryptroot";
      fsType = "bcachefs";
    };

  boot.initrd.luks.devices."cryptroot".device = "/dev/disk/by-uuid/7d61e423-1c76-4e0f-8d13-776f1e8e2a1b";
  boot.initrd.luks.devices."cryptswap".device = "/dev/disk/by-uuid/1533e741-924a-4940-bef3-d6aecb656ffc";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/BEC5-FFB3";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/2d69be51-f23d-4f07-b002-cedad13d1364"; }
    ];

  nix.maxJobs = lib.mkDefault 12;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  # High-DPI console
  console.font = lib.mkDefault "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
}
