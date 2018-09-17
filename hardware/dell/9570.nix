{ config, pkgs, ... }:

{
  imports =
  [
    ../webcam

    ../profiles/intel.nix
    ../profiles/nvidia.nix
    ../profiles/laptop.nix
    ../profiles/linux.nix
  ];

  boot = {
    kernelParams = [
      "acpi_rev_override=5"
      "psmouse.synaptics_intertouch=0"
    ];
  };

  services = {
    fwupd = {
      enable = true;
    };
  };
}
