{ ... }:

{
  services.xserver.libinput.touchpad = {
    clickMethod = "buttonareas";
    disableWhileTyping = true;
    enable = true;
    middleEmulation = true;
    tapping = true;

    additionalOptions = ''
      Option "PalmDetection" "on"
      Option "TappingButtonMap" "lmr"
    '';
  };
}
