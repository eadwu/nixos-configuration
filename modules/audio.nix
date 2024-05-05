{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./audio/pipewire.nix
      # ./audio/pulseaudio.nix
    ];

  boot.kernelModules = [ "uinput" ]; # AVRCP protocol support/compatibility for input device

  hardware.bluetooth.disabledPlugins = [ "sap" ];
  # hardware.bluetooth.settings = {
  #   General = {
  #     MultiProfile = "multiple";
  #     FastConnectable = true;
  #     Privacy = "device";
  #   };

  #   GATT = {
  #     KeySize = 16;
  #   };

  #   AVDTP = {
  #     SessionMode = "ertm";
  #     StreamMode = "streaming";
  #   };
  # };

  # Experimental, manual config, disable sap
  # systemd.services.bluetooth.serviceConfig.ExecStart = lib.mkForce
  #   [ ""
  #     "${pkgs.bluez}/libexec/bluetooth/bluetoothd -E -f /etc/bluetooth/main.conf --noplugin=sap" ];

  security.pam.loginLimits = [
    # maximum realtime priority
    {
      domain = "@audio";
      type = "-";
      item = "rtprio";
      value = "90";
    }

    # maximum locked-in-memory address space (KB)
    {
      domain = "@audio";
      type = "-";
      item = "memlock";
      value = "unlimited";
    }
  ];
}
