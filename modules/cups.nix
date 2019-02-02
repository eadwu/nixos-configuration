{ pkgs, lib, ... }:

{
  hardware.sane = {
    enable = true;
    extraBackends = lib.singleton pkgs.hplip;
  };

  services = {
    avahi = {
      enable = true;
      nssmdns = true;
    };

    printing = {
      enable = true;
      drivers = lib.singleton pkgs.hplip;
    };
  };
}
