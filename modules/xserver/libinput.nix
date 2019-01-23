{ ... }:

{
  services.xserver.libinput = {
    clickMethod = "buttonareas";
    disableWhileTyping = true;
    enable = true;
    middleEmulation = true;
    tapping = true;
  };
}
