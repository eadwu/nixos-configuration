{ config, pkgs, ... }:

{
  services = {
    logind = {
      extraConfig = builtins.readFile ./logind.conf;
    };
  };
}
