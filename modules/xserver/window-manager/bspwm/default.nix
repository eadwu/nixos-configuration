{ pkgs, ... }:

assert builtins.pathExists ./bspwmrc;
assert builtins.pathExists ./sxhkdrc;

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
