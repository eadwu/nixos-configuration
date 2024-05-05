{ lib, ... }:

{
  boot.blacklistedKernelModules = [
    "nouveau"
    "nvidiafb"

    "nvidia"
    "nvidia-uvm"
    "nvidia_drm"
    "nvidia_modeset"
  ];

  # Integrated only
  # hardware.nvidiaOptimus.disable = true;

  # services.udev.extraRules = ''
  #   # Runtime PM for Intel Corporation JHL6340 Thunderbolt 3 Bridge (Razer Core X)
  #   # Turns off GPU PD, but not charging
  #   ACTION=="add", SUBSYSTEMS=="pci", ATTRS{vendor}=="0x8086", ATTRS{device}=="0x15da", TEST=="power/control", ATTR{power/control}="auto"

  #   # Runtime PM for NVIDIA GPU
  #   ACTION=="add", SUBSYSTEMS=="pci", ATTRS{vendor}=="0x10de", TEST=="power/control", ATTR{power/control}="auto"

  #   # Runtime PM for PCI Device NVIDIA Corporation GP107M [GeForce GTX 1050 Ti Mobile] (Dell XPS 9570)
  #   ACTION=="add", SUBSYSTEMS=="pci", ATTRS{vendor}=="0x8086", ATTRS{device}=="0x1901", TEST=="power/control", ATTR{power/control}="auto"

  #   # Runtime PM for PCI Device NVIDIA Corporation GA102 [GeForce RTX 3080 Ti]
  #   ACTION=="add", SUBSYSTEMS=="pci", ATTRS{vendor}=="0x10de", ATTRS{device}=="0x2208", TEST=="power/control", ATTR{power/control}="auto"
  # '';
}
