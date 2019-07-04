{ pkgs, ... }:

{
  boot.kernelParams = [
    # Enable power-saving display C-states
    "i915.enable_dc=1"
    # Enable frame buffer compression for power savings
    "i915.enable_fbc=1"
    # Enable PSR
    "i915.enable_psr=1"
    # Display power wells are always on
    "i915.disable_power_well=0"
    # Enable GuC load for GuC submission and/or HuC load
    "i915.enable_guc=-1"
  ];

  environment.systemPackages = with pkgs; [
    libva-utils
  ];

  hardware.opengl.extraPackages = with pkgs; [
    vaapiIntel
  ];

  services.xserver = {
    useGlamor = true;

    # deviceSection = ''
    #   Option "DRI" "2"
    #   Option "TearFree" "True"
    # '';
  };
}
