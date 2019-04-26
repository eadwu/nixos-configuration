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

    kernelPatches = let
      bcachefsSupport = config.boot.kernelPackages == pkgs.linuxPackages_testing_bcachefs;
      needBcachefsSupport = builtins.elem "bcachefs" config.boot.supportedFilesystems;
    in [
      (import ../../patches/kernel/harden-kernel.nix)
      (import ../../patches/kernel/disable-amateur-radio-support.nix)
    ] ++ lib.optional (!bcachefsSupport && needBcachefsSupport)
      (import ../../patches/kernel/bcachefs.nix);
  };

  security.pam.defaults = ''
    session required pam_keyinit.so force revoke
  '';
}
