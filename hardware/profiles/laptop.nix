{ pkgs, lib, ... }:

{
  boot.kernelParams = [
    # https://wiki.archlinux.org/index.php/improving_performance#Changing_I/O_scheduler
    "scsi_mod.use_blk_mq=1"
  ];

  fileSystems."/".options = [
    "noatime"
    "nodiratime"
  ];

  hardware = {
    enableRedistributableFirmware = true;
    bluetooth.enable = true;
    opengl.enable = true;
  };

  powerManagement.enable = true;

  services.irqbalance.enable = lib.mkDefault true;
  services.udev.extraRules = ''
    # Set scheduler for NVMe
    ACTION=="add|change", KERNEL=="nvme[0-9]*", ATTR{queue/scheduler}="none"
    # Set scheduler for SSD and eMMC
    ACTION=="add|change", KERNEL=="sd[a-z]|mmcblk[0-9]*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="mq-deadline"
    # Set scheduler for rotating disks
    ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="1", ATTR{queue/scheduler}="bfq"
    # Automatically suspend the system at <5%
    SUBSYSTEM=="power_supply", ATTR{status}=="Discharging", ATTR{capacity}=="[0-5]", RUN+="${pkgs.systemd}/bin/systemctl suspend"
  '';
}
