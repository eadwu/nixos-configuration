{ modulesPath, pkgs, lib, ... }:

{
  imports =
    [
      "${modulesPath}/profiles/hardened.nix"
    ];

  boot = {
    blacklistedKernelModules = [
      # https://wiki.archlinux.org/index.php/Improving_performance#Watchdogs
      "iTCO_wdt"
    ];

    kernel.sysctl = {
      "vm.swappiness" = 10;

      # Upstream systemd defaults to only sync
      # https://github.com/NixOS/nixpkgs/issues/83694#issuecomment-605657381
      "kernel.sysrq" = 438;

      # Turn off kexec, even if it's built in.
      "kernel.kexec_load_disabled" = 1;

      # https://github.com/NixOS/nixpkgs/pull/84522/commits/b7638115f6e8b73915809bf46acf08f114bbbbd5
      "kernel.unprivileged_userns_clone" = true;
    };

    kernelModules = [
      # Filesystem support
      "ext4"
      # Explicitly load these for usb read/write support
      "bfq" # Register io scheduler for usb
      "uas"
      "sd_mod"
      "usb_storage"
    ];

    kernelParams = [
      "threadirqs"

      # Increasing the virtual memory dirty writeback time helps to aggregate disk I/O together
      "vm.dirty_writeback_centisecs=6000"

      # Wipe slab and page allocations (supersedes "slub_debug=P" and "page_poison=1" above, since v5.3)
      "init_on_alloc=1"
      "init_on_free=1"

      # Use TEO as CPUIdle Governor
      "cpuidle.governor=teo"
    ];
  };

  # Multiple virtual cores per physical core
  # NOTE: About 30% boost compared to a single physical core
  security.allowSimultaneousMultithreading = lib.mkDefault false;

  # This service will ensure that a realtime process won't hang the machine.
  services.das_watchdog.enable = lib.mkDefault true;
}
