{ ... }:

{
  boot.blacklistedKernelModules = [
    # Disabling the HDMI audio output
    "snd_hda_codec_hdmi"
  ];

  boot.kernelParams = [
    # Enable powersaving for Intel soundcards
    "snd_hda_intel.power_save=1"
  ];
}
