{ ... }:

{
  boot.blacklistedKernelModules = [
    # Disable integrated webcam
    "uvcvideo"

    # Disable integrated microphone
    "snd_hda_intel"
  ];
}
