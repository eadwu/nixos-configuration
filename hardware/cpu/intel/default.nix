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

    "kvm_intel.nested=1"
    "kvm_intel.enable_apicv=1"
    # https://www.linux-kvm.org/images/e/e9/Kvm-forum-2013-nested-virtualization-shadow-turtles.pdf
    "kvm_intel.enlightened_vmcs=1"
    "kvm_intel.enable_shadow_vmcs=1"

    "snd-hda-intel.enable_msi=1"
  ];

  environment.systemPackages = with pkgs; [ pcm config.boot.kernelPackages.intel-speed-select ];

  hardware.cpu.intel.updateMicrocode = true;
  hardware.opengl.extraPackages = with pkgs; [ intel-ocl ];

  services.undervolt.enable = lib.mkDefault true;
  services.thermald.enable = lib.mkDefault true;
}
