{ ... }:

{
  services.xserver.windowManager = {
    default = "hm";
    bspwm.enable = true;
    dwm.enable = true;

    # Started through home-manager
    session = [
      {
        name = "hm";
        start = "";
      }
    ];
  };
}
