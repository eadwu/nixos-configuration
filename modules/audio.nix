{ config, ... }:

{
  imports =
    [
      ./audio/pipewire.nix
      # ./audio/pulseaudio.nix
    ];

  boot.kernelModules = [ "uinput" ]; # AVRCP protocol support/compatibility for input device

  hardware.bluetooth.disabledPlugins = [ "sap" ];
  hardware.bluetooth.settings = {
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
