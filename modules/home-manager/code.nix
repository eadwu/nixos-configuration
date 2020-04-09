{ pkgs, ... }:

{
  xdg.configFile = {
    "Code/User/keybindings.json".text = builtins.toJSON (import ./code/keybindings.nix);
    "Code/User/settings.json".text = builtins.toJSON (import ./code/settings.nix { inherit pkgs; });
    "Code - Insiders/User/keybindings.json".text = builtins.toJSON (import ./code/keybindings.nix);
    "Code - Insiders/User/settings.json".text = builtins.toJSON (import ./code/settings.nix { inherit pkgs; });
  };

  home.packages = with pkgs; [
    vscode-with-extensions
  ];
}
