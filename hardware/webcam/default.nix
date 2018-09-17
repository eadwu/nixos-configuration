{ config, pkgs, ... }:

{
  boot = {
    blacklistedKernelModules = [
      # Disable integrated webcam
      "uvcvideo"
    ];
  };
}
