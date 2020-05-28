{ lib, ... }:

{
  imports =
   [
     ./libvirt.nix
   ];

  virtualisation.docker.enable = true;
  virtualisation.kvmgt.enable = lib.mkDefault true;
}
