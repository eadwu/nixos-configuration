{ ... }:

{
  imports =
    [
      ./libinput.nix
      ./desktop-manager
      ./display-manager
      ./window-manager
    ];

  services.xserver = {
    enable = true;
    xkb.layout = "us";
  };
}
