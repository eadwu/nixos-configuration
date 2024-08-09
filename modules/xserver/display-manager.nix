{ pkgs, lib, ... }:

{
  imports =
    [
      {
        services.xserver.displayManager.lightdm.greeters.enso.blur = true;
      }

      {
        services.xserver.displayManager.lightdm.greeters.gtk = {
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
      }

      {
        services.displayManager.sddm.wayland.enable = true;
        services.displayManager.sddm.settings.General.InputMethod = lib.mkForce "";
      }
    ];
}
