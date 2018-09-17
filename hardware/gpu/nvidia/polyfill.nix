{ config, pkgs, lib, ... }:

let
  inherit (config.boot.kernelPackages) nvidia_x11_beta;
in {
  boot = {
    extraModulePackages = [
      nvidia_x11_beta.bin
    ];
  };

  environment = {
    systemPackages = [
      nvidia_x11_beta.bin
      nvidia_x11_beta.settings
    ] ++ lib.filter (p: p != null) [
      nvidia_x11_beta.persistenced
    ];
  };

  services = {
    acpid = {
      enable = true;
    };

    udev = {
      extraRules = ''
        KERNEL=="nvidia", RUN+="${pkgs.runtimeShell} -c 'mknod -m 666 /dev/nvidiactl c $(grep nvidia-frontend /proc/devices | cut -d \  -f 1) 255'"
        KERNEL=="nvidia_modeset", RUN+="${pkgs.runtimeShell} -c 'mknod -m 666 /dev/nvidia-modeset c $(grep nvidia-frontend /proc/devices | cut -d \  -f 1) 254'"
        KERNEL=="card*", SUBSYSTEM=="drm", DRIVERS=="nvidia", RUN+="${pkgs.runtimeShell} -c 'mknod -m 666 /dev/nvidia%n c $(grep nvidia-frontend /proc/devices | cut -d \  -f 1) %n'"
        KERNEL=="nvidia_uvm", RUN+="${pkgs.runtimeShell} -c 'mknod -m 666 /dev/nvidia-uvm c $(grep nvidia-uvm /proc/devices | cut -d \  -f 1) 0'"
      '';
    };
  };
}
