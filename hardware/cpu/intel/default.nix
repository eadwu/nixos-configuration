{ pkgs, lib, ... }:

{
  imports =
    [
      ../../../options/undervolt.nix
    ];

  disabledModules =
    [
      <nixpkgs/nixos/modules/services/hardware/undervolt.nix>
    ];

  boot.kernelParams = [
    # Allow the use of other cpu frequency governors
    "intel_pstate=passive"
  ];

  environment.systemPackages = with pkgs; [
    pcm
  ];

  hardware.cpu.intel.updateMicrocode = true;

  services.undervolt.enable = lib.mkDefault true;
}
