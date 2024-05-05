{ lib, ... }:

{
  # boot.kernelParams = [
  #   "intel_pstate=passive"
  #   "cpufreq.default_governor=schedutil"
  # ];

  services.tlp.enable = lib.mkDefault true;
  services.tlp.settings = {
    # # Set CPU governors
    # CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
    # CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";

    # # Don't allow Turbo {Boost|Core} on battery
    # CPU_BOOST_ON_AC = 1;
    # CPU_BOOST_ON_BAT = 0;

    # # Intel CPU HWP hints
    # CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
    # CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

    # # Set CPU Frequency constraints
    # ### i7-8750H base frequency 2.20 GHz
    # ## intel_pstate driver
    # CPU_MIN_PERF_ON_AC = 0;
    # CPU_MAX_PERF_ON_AC = 100;
    # CPU_MIN_PERF_ON_BAT = 0;
    # CPU_MAX_PERF_ON_BAT = 80;
    # ## cpufreq driver
    # CPU_SCALING_MIN_FREQ_ON_AC = 800000; # 800000
    # CPU_SCALING_MAX_FREQ_ON_AC = 3200000; # 4100000
    # CPU_SCALING_MIN_FREQ_ON_BAT = 800000; # 800000
    # CPU_SCALING_MAX_FREQ_ON_BAT = 3200000; # 4100000

    # Use minimum amount of cores on battery
    SCHED_POWERSAVE_ON_AC = 0;
    SCHED_POWERSAVE_ON_BAT = 1;

    RUNTIME_PM_DRIVER_DENYLIST = "nouveau nvidia";
  };
}
