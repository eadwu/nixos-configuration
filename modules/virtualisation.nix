{ pkgs, lib, ... }:

{
  imports =
   [
     ./libvirt.nix
   ];

  boot.kernelParams = [
    "kvm.ignore_msrs=1"
  ];

  boot.kernelModules = [
    "nbd" # mount Qemu disks
  ];

  environment.systemPackages = with pkgs; [
    looking-glass-client
    virt-viewer
  ];

  virtualisation.docker.enable = true;
  virtualisation.kvmgt.enable = lib.mkDefault true;

  # Qemu needs more than 64KB of memory to communicate with Direct Memory Access (DMA) with the VFIO GPU
  # Should generally be around the amount of memory allocated for the VM
  security.pam.loginLimits = [
    { domain = "@kvm";
      type = "-";
      item = "memlock";
      value = "unlimited"; }
  ];

  systemd.tmpfiles.rules = [
    "f /dev/shm/looking-glass 0660 root kvm -"
  ];
}
