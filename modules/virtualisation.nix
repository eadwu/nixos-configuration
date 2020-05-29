{ pkgs, lib, ... }:

{
  imports =
   [
     ./libvirt.nix
   ];

  boot.kernelParams = [
    "kvm.ignore_msrs=1"
  ];

  environment.systemPackages = with pkgs; [
    swtpm
    looking-glass-client
  ];

  virtualisation.docker.enable = true;
  virtualisation.kvmgt.enable = lib.mkDefault true;

  systemd.tmpfiles.rules = [
    "f /dev/shm/looking-glass 0660 root kvm -"
  ];
}
