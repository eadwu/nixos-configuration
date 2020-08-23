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
    sessionVariables.MESA_LOADER_DRIVER_OVERRIDE = lib.mkDefault "iris";
  };

  hardware.opengl = {
    # Override mesa derivation with iris driver
    # Priority is less than mkDefault (1000) but greater than default (0) to resolve conflicts
    package = lib.mkOverride 999
      (
        (pkgs.mesa.override {
          galliumDrivers = [ "iris" "r300" "r600" "radeonsi" "nouveau" "virgl" "svga" "swrast" ];
        }).overrideAttrs (oldAttrs: {
          # Fix to Iris as per https://github.com/NixOS/nixpkgs/issues/91145
          nativeBuildInputs = (oldAttrs.nativeBuildInputs or [ ]) ++ [
            (with pkgs;
            patchelfUnstable.overrideAttrs (_: {
              version = "2020-08-17";
              src = fetchFromGitHub {
                owner = "NixOS";
                repo = "patchelf";
                rev = "7aa6b90851eba4eeb59bc75cbf40866fbce7b386";
                sha256 = "0xmrxb9ff392h04mq7ch8bg2lhlix3zvk23r130fg5mnbqcq6nxk";
              };
            }))
          ];
        })
      ).drivers;
    extraPackages = with pkgs; [ vaapiIntel intel-ocl intel-media-driver intel-compute-runtime ];
  };

  services.xserver = {
    useGlamor = true;
    videoDrivers = lib.mkDefault [ "modesetting" ];
  };
}
