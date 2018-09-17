{ config, pkgs, ... }:

let
  settings = import ../../settings.nix;

  kbd_backlight = pkgs.writeShellScriptBin "kbd_backlight" (builtins.readFile ./kbd_backlight);
  mon_backlight = pkgs.writeShellScriptBin "mon_backlight" (builtins.readFile ./mon_backlight);
in with settings; {
  environment = {
    systemPackages = [
      kbd_backlight
      mon_backlight
    ];
  };

  security = {
    sudo = {
      extraConfig = ''
        ${user} ALL=(ALL:ALL) NOPASSWD: ${kbd_backlight}/bin/kbd_backlight
        ${user} ALL=(ALL:ALL) NOPASSWD: ${mon_backlight}/bin/mon_backlight
      '';
    };
  };
}
