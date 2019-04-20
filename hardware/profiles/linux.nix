{ config, pkgs, lib, ... }:

{
  boot = {
    blacklistedKernelModules = [
      # https://wiki.archlinux.org/index.php/Improving_performance#Watchdogs
      "iTCO_wdt"
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

    kernelPatches = lib.optionals (config.boot.kernelPackages.kernel.version == pkgs.linux_testing.version) [
      (import ../../patches/kernel/harden-kernel.nix)
      (import ../../patches/kernel/disable-amateur-radio-support.nix)
    ];
  };
}
