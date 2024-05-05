{ nixosModules, modulesPath, pkgs, lib, ... }:

{
  imports =
    [
      # nixosModules.custom
      # nixosModules.sysfs

      ./hardened.nix
      "${modulesPath}/profiles/hardened.nix"
    ];

  boot = {
    initrd.compressor = "${lib.getBin pkgs.zstd}/bin/zstd";

    blacklistedKernelModules = [
      # https://wiki.archlinux.org/index.php/Improving_performance#Watchdogs
      # Intel, HP, IBM, Xen (VM)
      # "iTCO_wdt" "hpwdt" "vmwatchdog" "xen_wdt"
    ];

    kernel.sysctl = {
      # Upstream systemd defaults to only sync
      # https://github.com/NixOS/nixpkgs/issues/83694#issuecomment-605657381
      # "kernel.sysrq" = 438;

      # https://github.com/NixOS/nixpkgs/pull/84522/commits/b7638115f6e8b73915809bf46acf08f114bbbbd5
      "kernel.unprivileged_userns_clone" = true;
    };

    kernelModules = [
      # Filesystem support
      "ext4"
      "ntfs3"
      # Explicitly load these for usb read/write support
      "bfq" # Register io scheduler for usb
      "uas"
      "sd_mod"
      "usb_storage"

      # LUKS
      "dm_crypt"

      # VFIO
      "vfio"
      "vfio_iommu_type1"
      "vfio_pci"
      "vfio_virqfd"

      # Virtio/Host passthrough
      "vhost-net"
      "virtio_net"
      "virtio_pmem"
      "virtio_blk"
      "virtio_crypto"
      "virtio-gpu"
      "virtio_console"
      "virtio-rng"
      "virtio_rpmsg_bus"
      "virtio_scsi"
      "virtio_input"
      "virtio"
      "virtio_balloon"
      "virtio_mmio"
      "virtio_pci"
      "virtio_ring"
      "virtiofs"
    ];

    kernelParams = [
      # Increasing the virtual memory dirty writeback time helps to aggregate disk I/O together
      "vm.dirty_writeback_centisecs=6000"

      # Use TEO as CPUIdle Governor
      "cpuidle.governor=teo"
    ];
  };

  # Multiple virtual cores per physical core
  # NOTE: About 30% boost compared to a single physical core
  security.allowSimultaneousMultithreading = lib.mkDefault false;
}
