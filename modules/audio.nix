{ pkgs, ... }:

{
  imports = [
    {
      # AVRCP protocol support/compatibility for input device
      # Such as volume control through bluetooth
      boot.kernelModules = [ "uinput" ];
      hardware.bluetooth.disabledPlugins = [ "sap" ];
    }

    {
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
  ];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    pulse.enable = true;

    # Use wireplumber as the session manager
    wireplumber.enable = true;
  };

  environment.systemPackages = with pkgs; [ pavucontrol pulseaudio ];
}
