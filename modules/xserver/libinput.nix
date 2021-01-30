{ ... }:

{
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad = {
    clickMethod = "buttonareas";
    disableWhileTyping = true;
    middleEmulation = true;
    tapping = true;

    additionalOptions = ''
      Option "PalmDetection" "on"
      Option "TappingButtonMap" "lmr"
    '';
  };
}
