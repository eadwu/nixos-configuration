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
    scream-receivers
    looking-glass-client
  ];

  virtualisation.docker.enable = true;
  virtualisation.kvmgt.enable = lib.mkDefault true;

  systemd.tmpfiles.rules = [
    "f /dev/shm/scream        0660 root kvm -"
    "f /dev/shm/looking-glass 0660 root kvm -"
  ];

  systemd.user.services.scream-ivshmem = {
    enable = true;
    description = "Scream IVSHMEM";
    serviceConfig = {
      ExecStart = "${pkgs.scream-receivers}/bin/scream-ivshmem-pulse /dev/shm/scream";
      Restart = "always";
    };
    wantedBy = [ "multi-user.target" ];
    requires = [ "pulseaudio.service" ];
  };
}
