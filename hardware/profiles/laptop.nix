{ pkgs, ... }:

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

    opengl = {
      driSupport32Bit = true;
      enable = true;
    };
  };

  powerManagement.enable = true;

  services.udev.extraRules = ''
    # Set scheduler for SSDs
    ACTION=="add|change", KERNEL=="sd[a-z]|mmcblk[0-9]*|nvme[0-9]*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="mq-deadline"
    # Automatically suspend the system at <5%
    SUBSYSTEM=="power_supply", ATTR{status}=="Discharging", ATTR{capacity}=="[0-5]", RUN+="${pkgs.systemd}/bin/systemctl suspend"
  '';
}
