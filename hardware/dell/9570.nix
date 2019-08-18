{ ... }:

{
  imports =
    [
      ../profiles/uefi.nix
      ../profiles/intel.nix
      ../profiles/laptop.nix
      ../profiles/linux.nix
    ];

  boot.kernelParams = [
    "acpi_rev_override=5"
    "mem_sleep_default=deep"
    "psmouse.synaptics_intertouch=0"
  ];

  hardware.nvidia.prime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  services.fwupd.enable = true;
  services.fstrim.enable = false;
}
