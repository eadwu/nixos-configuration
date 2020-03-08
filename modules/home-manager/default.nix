{ ... }:

{
  imports =
    [
      ./common.nix
      # Machines
      # ./machines/virtual.nix

      # Window Manager
      # ./bspwm.nix
      ./dwm.nix
      # ./xmonad.nix
    ];
}
