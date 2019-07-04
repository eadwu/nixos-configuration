{ pkgs, ... }:

{
  boot.kernelParams = [
    # Allow the use of other cpu frequency governors
    "intel_pstate=passive"
  ];

  environment.systemPackages = with pkgs; [
    pcm
  ];

  hardware.cpu.intel.updateMicrocode = true;
}
