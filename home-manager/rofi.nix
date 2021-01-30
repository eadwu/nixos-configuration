{ pkgs, lib, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.st}/bin/st";
    extraConfig = {
      modi = "drun,run,window,ssh";
      threads = 0;
    };
  };

  xdg.configFile = lib.genAttrs
    (map
      (attr: "rofi/${attr}")
      (builtins.attrNames
        (lib.filterAttrs (_: v: v == "regular")
          (builtins.readDir ./rofi))))
    (path: { source = (builtins.toString ./.) + "/${path}"; });
}
