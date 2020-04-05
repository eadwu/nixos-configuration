{ pkgs, lib, ... }:

{
  imports =
    [
      ../../../options/undervolt.nix
    ];

  disabledModules =
    [
      "services/hardware/undervolt.nix"
    ];

  environment.systemPackages = with pkgs; [ pcm ];

  hardware.cpu.intel.updateMicrocode = true;
  hardware.opengl.extraPackages = with pkgs; [ intel-ocl ];

  services.undervolt.enable = lib.mkDefault true;
  services.thermald.enable = lib.mkDefault true;
}
