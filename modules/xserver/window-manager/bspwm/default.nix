{ pkgs, ... }:

assert builtins.pathExists ./bspwmrc;
assert builtins.pathExists ./sxhkdrc;

{
  environment.systemPackages = with pkgs; [
    polybar
    xdo
  ];

  services.xserver.windowManager = {
    default = "bspwm";

    bspwm = {
      configFile = ./bspwmrc;
      enable = true;

      sxhkd.configFile = ./sxhkdrc;
    };
  };
}
