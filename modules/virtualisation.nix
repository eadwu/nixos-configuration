{ lib, ... }:

{
  virtualisation = {
    docker.enable = true;
    libvirtd.enable = lib.mkDefault true;
  };
}
