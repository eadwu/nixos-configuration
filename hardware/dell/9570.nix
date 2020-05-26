{ pkgs, ... }:

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

    # Zfs, restrict usage to 4 GB
    "zfs.zfs_arc_max=4294967296"
  ];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  environment.systemPackages = with pkgs; [
    libsmbios
  ];

  hardware.nvidia.prime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  services.fwupd.enable = true;
  services.fstrim.enable = false;
  services.undervolt.enable = false;

  virtualisation.kvmgt.vgpus."i915-GVTg_V5_4" = {
    uuid = "fc9fca8a-9ee7-11ea-aab9-733b28dbb12d";
  };
}
