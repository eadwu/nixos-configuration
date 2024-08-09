{ ... }:

{
  imports =
    [
      ./libinput.nix
      ./display-manager.nix

      {
        services.xserver.desktopManager.xterm.enable = false;
      }
    ];
}
