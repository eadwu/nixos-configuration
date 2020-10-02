{ config, pkgs, ... }:

{
  environment.variables = {
    # Ultra low latency mode
    # https://devtalk.nvidia.com/default/topic/1067593/linux/how-to-turn-on-low-latency-mode-max-pre-render-frames-on-linux-/
    __GL_MaxFramesAllowed = "0";
    # Anisotropic texture filtering, 0-4, 0x, 2x, 4x, 8x, 16x
    __GL_LOG_MAX_ANISO = "4";
  };

  environment.systemPackages = with pkgs; [
    glxinfo
    cudatoolkit
    vdpauinfo
  ];

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
  hardware.nvidia.nvidiaPersistenced = true;
  hardware.nvidia.powerManagement.enable = true;
  hardware.opengl.extraPackages = with pkgs; [
    vaapiVdpau
    libvdpau-va-gl
  ];

  services.xserver.useGlamor = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  boot.kernelParams = [
    # PCI-Express Runtime D3 (RTD3) Power Management
    # https://download.nvidia.com/XFree86/Linux-x86_64/450.51/README/dynamicpowermanagement.html
    "nvidia.NVreg_DynamicPowerManagement=0x02"
    # If the Spectre V2 mitigation is necessary, some performance may be recovered by setting the
    # NVreg_CheckPCIConfigSpace kernel module parameter to 0. This will disable the NVIDIA driver's
    # sanity checks of GPU PCI config space at various entry points, which were originally required
    # to detect and correct config space manipulation done by X server versions prior to 1.7.
    "nvidia.NVreg_CheckPCIConfigSpace=0"
    # Enable the PAT feature [5], which affects how memory is allocated. PAT was first introduced in
    # Pentium III [6] and is supported by most newer CPUs (see wikipedia:Page attribute table#Processors).
    # If your system can support this feature, it should improve performance.
    "nvidia.NVreg_UsePageAttributeTable=1"
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
