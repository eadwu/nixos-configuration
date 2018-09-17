{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      polybar
      xdo
    ];
  };

  services = {
    xserver = {
      windowManager = {
        bspwm = {
          configFile = ./bspwmrc;
          enable = true;

          sxhkd = {
            configFile = ./sxhkdrc;
          };
        };

        default = "bspwm";
      };
    };
  };
}
