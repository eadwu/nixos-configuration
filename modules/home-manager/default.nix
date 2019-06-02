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
      # Nvidia Optimus
      # ./bumblebee.nix
    ];
}
