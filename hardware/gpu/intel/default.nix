{ config, pkgs, ... }:

{
  boot = {
    kernelParams = [
      # https://ivanvojtko.blogspot.com/2016/04/how-to-get-longer-battery-life-on-linux.html
      "i915.enable_fbc=1"

      "i915.enable_guc=-1"
      "i915.enable_psr=1"
      "i915.disable_power_well=0"
    ];
  };

  environment = {
    systemPackages = with pkgs; [
      libva-utils
    ];
  };

  hardware = {
    opengl = {
      extraPackages = with pkgs; [
        vaapiIntel
      ];
    };
  };

  services = {
    xserver = {
      useGlamor = true;

      # deviceSection = ''
      #   Option "DRI" "2"
      #   Option "TearFree" "True"
      # '';
    };
  };
}
