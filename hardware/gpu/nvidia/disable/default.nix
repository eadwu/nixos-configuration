{ config, pkgs, ... }:

{
  boot = {
    blacklistedKernelModules = [
      "nouveau"
      "nvidiafb"

      "nvidia"
      "nvidia-uvm"
      "nvidia_drm"
      "nvidia_modeset"
    ];
  };

  services = {
    udev = {
      extraRules = ''
        # Runtime PM for PCI Device NVIDIA Corporation GP107M [GeForce GTX 1050 Ti Mobile]
        ACTION=="add", SUBSYSTEMS=="pci", ATTRS{device}=="0x1901", ATTRS{vendor}=="0x8086", TEST=="power/control", ATTR{power/control}:="auto"
      '';
    };

    xserver = {
      videoDrivers = [
        "modesetting"
      ];
    };
  };
}
