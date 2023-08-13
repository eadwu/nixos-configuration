{ pkgs, ... }:

{
  imports =
    [
      ../cpu/intel
      ../gpu/intel
      ../audio/intel
    ];

  environment.systemPackages = with pkgs; [
    # Sometimes needed on new hardware for backlight control.
    # xorg.xbacklight
    # xorg.xf86videointel
  ];
}
