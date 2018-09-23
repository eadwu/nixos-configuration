{ config, pkgs, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
    };

    virtualbox = {
      host = {
        enable = true;
      };
    };
  };
}
