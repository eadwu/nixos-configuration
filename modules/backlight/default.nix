{ config, pkgs, ... }:

let
  kbd_backlight = pkgs.writeShellScriptBin "kbd_backlight" (builtins.readFile ./kbd_backlight);
  mon_backlight = pkgs.writeShellScriptBin "mon_backlight" (builtins.readFile ./mon_backlight);
in with config.nixos.custom; {
  environment = {
    systemPackages = [
      kbd_backlight
      mon_backlight
    ];
  };

  security = {
    sudo = {
      extraConfig = ''
        ${settings.system.user} ALL=(ALL:ALL) NOPASSWD: ${kbd_backlight}/bin/kbd_backlight
        ${settings.system.user} ALL=(ALL:ALL) NOPASSWD: ${mon_backlight}/bin/mon_backlight
      '';
    };
  };
}
