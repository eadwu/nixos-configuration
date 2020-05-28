{ config, pkgs, lib, ... }:

{
  imports =
    [
      ../../../options/undervolt.nix
    ];

  disabledModules =
    [
      "services/hardware/undervolt.nix"
    ];

  boot.kernelModules = [
    "kvm_intel"
  ];

  boot.kernelParams = [
    "intel_iommu=on"
    "iommu=pt"
  ];

  environment.systemPackages = with pkgs; [ pcm config.boot.kernelPackages.intel-speed-select ];

  hardware.cpu.intel.updateMicrocode = true;
  hardware.opengl.extraPackages = with pkgs; [ intel-ocl ];

  services.undervolt.enable = lib.mkDefault true;
  services.thermald.enable = lib.mkDefault true;
}
