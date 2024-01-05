{ pkgs, lib, ... }:

{
  hardware.sane = {
    enable = lib.mkDefault true;
    extraBackends = [ pkgs.hplip ];
  };

  services = {
    avahi = {
      enable = lib.mkDefault true;
      nssmdns4 = true;
      openFirewall = false;
    };

    printing = {
      enable = lib.mkDefault true;
      drivers = [ pkgs.hplip ];
      webInterface = true;
    };
  };
}
