{ ... }:

{
  services = {
    tlp = {
      enable = true;
      extraConfig = ''
        CPU_SCALING_GOVERNOR_ON_AC=performance
        CPU_SCALING_GOVERNOR_ON_BAT=schedutil

        CPU_MIN_PERF_ON_AC=0
        CPU_MAX_PERF_ON_AC=100
        CPU_MIN_PERF_ON_BAT=0
        CPU_MAX_PERF_ON_BAT=40

        CPU_BOOST_ON_AC=1
        CPU_BOOST_ON_BAT=0
      '';
    };
  };
}
