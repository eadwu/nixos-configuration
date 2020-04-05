{ flakes, lib, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "${flakes.external.st}/bin/st";
  };

  xdg.configFile = lib.genAttrs
    (map
      (attr: "rofi/${attr}")
      (builtins.attrNames
        (lib.filterAttrs (_: v: v == "regular")
        (builtins.readDir ./rofi))))
    (path: { source = (builtins.toString ./.) + "/${path}"; });
}
