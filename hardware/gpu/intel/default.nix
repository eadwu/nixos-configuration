{ pkgs, lib, ... }:

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

  environment = {
    systemPackages = with pkgs; [ libva-utils ];
    variables.MESA_LOADER_DRIVER_OVERRIDE = lib.mkDefault "iris";
  };

  hardware.opengl = {
    # Override mesa derivation with iris driver
    # Priority is less than mkDefault (1000) but greater than default (0) to resolve conflicts
    package = lib.mkOverride 999 (pkgs.mesa.override {
      galliumDrivers = [ "iris" "r300" "r600" "radeonsi" "nouveau" "virgl" "svga" "swrast" ];
    }).drivers;
    extraPackages = with pkgs; [ vaapiIntel intel-media-driver ];
  };

  services.xserver = {
    useGlamor = true;
    videoDrivers = lib.mkDefault [ "modesetting" ];
  };
}
