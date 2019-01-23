{ pkgs, ... }:

{
  imports =
    [
      ../cpu/intel
      ../gpu/intel
    ];

  environment.systemPackages = with pkgs; [
    intel-gpu-tools

    # Sometimes needed on new hardware for backlight control.
    # xorg.xbacklight
    # xorg.xf86videointel
  ];
}
