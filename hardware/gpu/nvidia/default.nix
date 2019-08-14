{ pkgs, ... }:

{
  environment.variables = {
    # Experimental environment variable for better gpu clock boost handling
    # https://devtalk.nvidia.com/default/topic/1048768/linux/if-you-have-gpu-clock-boost-problems-please-try-__gl_experimentalperfstrategy-1/3
    __GL_ExperimentalPerfStrategy = "1";
  };

  environment.systemPackages = with pkgs; [
    glxinfo cudatoolkit
    vdpauinfo
  ];

  hardware.opengl.extraPackages = with pkgs; [
    vaapiVdpau
    libvdpau-va-gl
  ];

  services.xserver.useGlamor = true;
  services.xserver.videoDrivers = [ "nvidiaBeta" ];
}
