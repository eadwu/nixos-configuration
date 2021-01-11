{ config, ... }:

{
  imports =
    [
      ./audio/pipewire.nix
      # ./audio/pulseaudio.nix
    ];

  boot.kernelModules = [ "uinput" ]; # AVRCP protocol support/compatibility for input device
  systemd.services.bluetooth.serviceConfig.ExecStart = [ "" "${config.hardware.bluetooth.package}/libexec/bluetooth/bluetoothd --noplugin=sap" ];

  hardware.bluetooth.config = {
    General = {
      MultiProfile = "multiple";
      FastConnectable = true;
      Privacy = "device";
    };

    GATT = {
      KeySize = 16;
    };

    AVDTP = {
      SessionMode = "ertm";
      StreamMode = "streaming";
    };
  };
}
