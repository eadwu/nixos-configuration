{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      polybar
    ];

    variables = {
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };
  };

  services = {
    xserver = {
      windowManager = {
        default = "dwm";

        dwm = {
          enable = true;
        };
      };
    };
  };
}
