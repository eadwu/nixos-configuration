{ pkgs, lib, ... }:

{
  hardware.sane = {
    enable = lib.mkDefault true;
    extraBackends = lib.singleton pkgs.hplip;
  };

  services = {
    avahi = {
      enable = lib.mkDefault true;
      nssmdns = true;
    };

    printing = {
      enable = lib.mkDefault true;
      drivers = lib.singleton pkgs.hplip;
      webInterface = true;
    };
  };
}
