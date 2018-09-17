{ config, pkgs, ... }:

{
  services = {
    xserver = {
      displayManager = {
        lightdm = {
          greeters = {
            gtk = {
              clock-format = "%I:%M %p";

              iconTheme = {
                name = "Papirus-Adapta-Nokto";
                package = pkgs.papirus-icon-theme;
              };

              theme = {
                name = "Adapta-Nokto";
                package = pkgs.adapta-gtk-theme;
              };
            };
          };
        };
      };
    };
  };
}
