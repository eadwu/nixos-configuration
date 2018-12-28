{ ... }:

{
  imports =
  [
    ../webcam

    ../profiles/uefi.nix
    ../profiles/intel.nix
    ../profiles/nvidia.nix
    ../profiles/laptop.nix
    ../profiles/linux.nix
  ];

  boot = {
    kernelParams = [
      "acpi_rev_override=5"
      "mem_sleep_default=deep"
      "psmouse.synaptics_intertouch=0"
    ];
  };

  services = {
    fwupd = {
      enable = true;
    };
  };
}
