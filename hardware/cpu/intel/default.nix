{ pkgs, ... }:

{
  boot.kernelParams = [
    # Use acpi-cpufreq as the CPU scaling governor
    "intel_pstate=passive"

    "i915.enable_dc=1"
  ];

  environment.systemPackages = with pkgs; [
    pcm
  ];

  hardware.cpu.intel.updateMicrocode = true;
}
