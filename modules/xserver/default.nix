{ ... }:

{
  imports =
    [
      ./libinput.nix
      ./desktop-manager
      ./display-manager
    ];

  services.xserver = {
    enable = true;
    layout = "us";
  };
}
