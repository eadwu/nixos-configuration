{ lib, ... }:

{
  services.xserver.windowManager = {
    default = "dwm";
    bspwm.enable = true;
    dwm.enable = true;
  };
}
