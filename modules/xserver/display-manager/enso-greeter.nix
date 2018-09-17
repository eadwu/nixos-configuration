{ config, pkgs, ... }:

{
  services = {
    xserver = {
      displayManager = {
        lightdm = {
          greeters = {
            enso = {
              blur = true;
            };
          };
        };
      };
    };
  };
}
