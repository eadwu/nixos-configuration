{ lib, ... }:

{
  imports =
    [
      ../polyfill.nix
    ];

  environment.variables = {
    # Experimental environment variable for better gpu clock boost handling
    # https://devtalk.nvidia.com/default/topic/1048768/linux/if-you-have-gpu-clock-boost-problems-please-try-__gl_experimentalperfstrategy-1/3
    __GL_ExperimentalPerfStrategy = "1";
  };

  hardware.nvidia = {
    modesetting.enable = true;

    optimus_prime = {
      enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  services.xserver.videoDrivers = lib.singleton "nvidiaBeta";
}
