{ ... }:

{
  services.libinput.enable = true;
  services.libinput.touchpad = {
    clickMethod = "buttonareas";
    disableWhileTyping = true;
    middleEmulation = true;
    tapping = true;

    additionalOptions = ''
      Option "TappingDrag" "on"
      Option "PalmDetection" "on"
      Option "TappingButtonMap" "lmr"
    '';
  };
}
