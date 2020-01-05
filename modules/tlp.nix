{ lib, ... }:

{
  services.tlp = {
    enable = lib.mkDefault true;
    extraConfig = ''
      CPU_HWP_ON_AC=balance_performance
      CPU_HWP_ON_BAT=balance_power

      CPU_SCALING_GOVERNOR_ON_AC=performance
      CPU_SCALING_GOVERNOR_ON_BAT=powersave

      CPU_MIN_PERF_ON_AC=0
      CPU_MAX_PERF_ON_AC=100
      CPU_MIN_PERF_ON_BAT=0
      CPU_MAX_PERF_ON_BAT=40

      CPU_BOOST_ON_AC=1
      CPU_BOOST_ON_BAT=0
    '';
  };
}
