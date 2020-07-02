{ pkgs, ... }:

{
  environment.variables = {
    # Ultra low latency mode
    # https://devtalk.nvidia.com/default/topic/1067593/linux/how-to-turn-on-low-latency-mode-max-pre-render-frames-on-linux-/
    __GL_MaxFramesAllowed = "0";
  };

  environment.systemPackages = with pkgs; [
    glxinfo
    cudatoolkit
    vdpauinfo
  ];

  hardware.nvidia.nvidiaPersistenced = true;
  hardware.nvidia.powerManagement.enable = true;
  hardware.opengl.extraPackages = with pkgs; [
    vaapiVdpau
    libvdpau-va-gl
  ];

  services.xserver.useGlamor = true;
  services.xserver.videoDrivers = [ "nvidiaBeta" ];

  # PCI-Express Runtime D3 (RTD3) Power Management
  # https://download.nvidia.com/XFree86/Linux-x86_64/450.51/README/dynamicpowermanagement.html
  boot.kernelParams = [
    "nvidia.NVreg_DynamicPowerManagement=0x02"
  ];

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
