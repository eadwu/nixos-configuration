{ config, pkgs, ... }:

{
  fileSystems = {
    "/" = {
      options = [
        "noatime"
        "nodiratime"
      ];
    };
  };

  hardware = {
    enableRedistributableFirmware = true;

    bluetooth = {
      enable = true;
    };

    opengl = {
      driSupport32Bit = true;
      enable = true;
    };
  };

  powerManagement = {
    enable = true;
  };

  services = {
    udev = {
      extraRules = ''
        # Automatically suspend the system at <5%
        SUBSYSTEM=="power_supply", ATTR{status}=="Discharging", ATTR{capacity}=="[0-5]", RUN+="${pkgs.systemd}/bin/systemctl suspend"
      '';
    };
  };
}
