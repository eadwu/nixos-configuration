{ pkgs, lib, ... }:

let
  keybindings = pkgs.writeText "keybindings.json"
    (builtins.toJSON (import ./keybindings.nix));
  settings = pkgs.writeText "settings.json"
    (builtins.toJSON (import ./settings.nix { inherit pkgs; }));
in
{
  home.file.".config/Code - Insiders/User/keybindings.json".source = keybindings;
  home.file.".config/Code - Insiders/User/settings.json".source = settings;

  home.packages = [ pkgs.vscode-insiders-with-extensions ];
}
