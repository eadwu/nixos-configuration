{ pkgs, ... }:

{
  # PCI-Express Runtime D3 (RTD3) Power Management
  # http://download.nvidia.com/XFree86/Linux-x86_64/435.17/README/dynamicpowermanagement.html
  boot.kernelParams = [
    "nvidia.NVreg_DynamicPowerManagement=0x02"
  ];

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
  services.xserver.deviceSection = ''
    Option "HardDPMS" "true"
  '';

  services.udev.extraRules = ''
    # Remove NVIDIA USB xHCI Host Controller devices, if present
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{remove}="1"

    # Remove NVIDIA USB Type-C UCSI devices, if present
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{remove}="1"

    # Remove NVIDIA Audio devices, if present
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{remove}="1"

    # Enable runtime PM for NVIDIA VGA/3D controller devices on driver bind
    ACTION=="bind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030000", TEST=="power/control", ATTR{power/control}="auto"
    ACTION=="bind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030200", TEST=="power/control", ATTR{power/control}="auto"

    # Disable runtime PM for NVIDIA VGA/3D controller devices on driver unbind
    ACTION=="unbind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030000", TEST=="power/control", ATTR{power/control}="on"
    ACTION=="unbind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030200", TEST=="power/control", ATTR{power/control}="on"
  '';
}
