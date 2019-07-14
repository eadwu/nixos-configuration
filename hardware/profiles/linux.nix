{ lib, ... }:

{
  imports =
    [
      <nixpkgs/nixos/modules/profiles/hardened.nix>
    ];

  boot = {
    blacklistedKernelModules = [
      # https://wiki.archlinux.org/index.php/Improving_performance#Watchdogs
      "iTCO_wdt"
    ];

    kernelModules = [
      # Explicitly load these for usb read/write support
      "bfq" # Register io scheduler for usb
      "uas"
      "sd_mod"
      "usb_storage"
    ];

    kernelParams = [
      # https://wiki.archlinux.org/index.php/Improving_performance#Watchdogs
      "nowatchdog"

      # https://wiki.archlinux.org/index.php/Power_management
      # Debugging feature to catch hardware hangs that cause a kernel panic
      # Disabling may cause decrease in power usage
      "nmi_watchdog=0"
      "snd_hda_intel.power_save=1"
      "vm.dirty_writeback_centisecs=6000"
    ];

    kernelPatches = lib.mkBefore [
      (import ../../patches/kernel/disable-amateur-radio-support.nix)
    ];
  };

  environment.memoryAllocator.provider = "libc";

  security = {
    # Some hardened option bypasses because of convenience/performance
    # Allow the use of sandboxes for Nix
    allowUserNamespaces = true;
    # Multiple virtual cores per physical core
    allowSimultaneousMultithreading = true;
  };
}
