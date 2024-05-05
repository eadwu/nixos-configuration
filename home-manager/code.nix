{ pkgs, lib, ... }:

let
  keybindings = pkgs.writeText "keybindings.json"
    (builtins.toJSON (import ./code/keybindings.nix));
  settings = pkgs.writeText "settings.json"
    (builtins.toJSON (import ./code/settings.nix { inherit pkgs; }));
in
{
  home.file.".config/Code - Insiders/User/keybindings.json".source = keybindings;
  home.file.".config/Code - Insiders/User/settings.json".source = settings;

  # systemd.user.tmpfiles.files = [
  #   "d /dev/shm/vscode/default                 2770 - users -"
  #   "d /dev/shm/vscode/insiders                2770 - users -"
  #   "L+ %h/.config/Code                        - - - - /dev/shm/vscode/default"
  #   ''L+ %h/.config/Code\ -\ Insiders          - - - - /dev/shm/vscode/insiders''
  # ];

  # Convoluted workaround so tmpfiles don't complain about symlink traversing /
  # home.file.".cache/.Code/keybindings.json".source = keybindings;
  # home.file.".cache/.Code/settings.json".source = settings;

  # # Should be before the rules that link the config directory into shared memory
  # systemd.user.tmpfiles.rules = lib.mkAfter [
  #   "L+ %h/.config/Code/User/keybindings.json             - - - - ${keybindings}"
  #   "L+ %h/.config/Code/User/settings.json                - - - - ${settings}"
  #   ''L+ %h/.config/Code\ -\ Insiders/User/keybindings.json - - - - ${keybindings}''
  #   ''L+ %h/.config/Code\ -\ Insiders/User/settings.json    - - - - ${settings}''
  # ];

  home.packages = with pkgs; [
    vscode-insiders-with-extensions
  ];
}
