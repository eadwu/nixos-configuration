{ lib, ... }:

{
  services.xserver.windowManager = {
    default = "hm";
    bspwm.enable = true;
    dwm.enable = true;

    # Started through home-manager
    session = lib.singleton {
      name = "hm";
      start = "";
    };
  };
}
