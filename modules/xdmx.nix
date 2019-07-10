{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xorg.xinit
  ];

  services.openssh = {
    enable = true;
    forwardX11 = true;
  };
}
