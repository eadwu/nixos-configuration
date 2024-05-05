{ pkgs, lib, ... }:

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

    "i915.enable_gvt=1"
  ];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  environment.systemPackages = with pkgs; [
    libsmbios
    nvme-cli
  ];

  hardware.nvidia.prime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  services.fwupd.enable = true;
  services.fstrim.enable = false;

  virtualisation.kvmgt = {
    device = "0000:00:02.0";
    vgpus = {
      "i915-GVTg_V5_4".uuid = [ "89e480b2-a293-11ea-9571-cbf5b0862006" ];
    };
  };

  services.thermald = {
    enable = lib.mkDefault true;
    configFile = ./thermald/9570/thermal-conf.xml.auto;
  };

  services.tlp.settings = {
    # Enable autosuspend for Goodix Fingerprint Device
    USB_WHITELIST = ''"27c6:5395"'';
  };

  services.udev.extraRules = ''
    # Enable rootless passthrough for Goodix Fingerprint Device
    SUBSYSTEM=="usb", ATTR{idVendor}=="27c6", ATTR{idProduct}=="5395", OWNER="root", GROUP="kvm"
  '';
}
