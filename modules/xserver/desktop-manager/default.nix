{ ... }:

{
  services = {
    xserver = {
      desktopManager = {
        default = "none";

        xterm = {
          enable = false;
        };
      };
    };
  };
}
