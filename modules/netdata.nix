{ config, pkgs, ... }:

{
  services = {
    netdata = {
      enable = true;
    };
  };
}
