{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ virtiofsd ];

  networking.firewall.checkReversePath = false;

  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
    onShutdown = "shutdown";
    qemu.ovmf.enable = true;
  };

  systemd.services.qemu-libvirtd-init = {
    after = [ "libvirtd.service" ];
    requires = [ "libvirtd.service" ];
    wantedBy = [ "libvirtd.service" ];

    path = [ pkgs.libvirt ];
    description = "QEMU libvirt default storage pool";
    serviceConfig = {
      Type = "oneshot";
      Restart = "no";
    };

    script = ''
      # No active storage pool called default
      if ! virsh pool-list --name | grep -q default; then
        # Yet the pool exists?! Heresy!
        if virsh pool-list --all | grep -q default; then
          virsh pool-delete default
          virsh pool-undefine default
        fi

        # Rereate images directory if needed
        if [ ! -d /var/lib/libvirt/images ]; then
          mkdir /var/lib/libvirt/images
          chgrp libvirtd /var/lib/libvirt/images
          chmod g+w /var/lib/libvirt/images
        fi

        virsh pool-define-as default dir --target /var/lib/libvirt/images
        virsh pool-autostart default
        virsh pool-start default
      fi
    '';
  };
}
