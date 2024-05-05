{ nixosModules, pkgs, ... }:

{
  imports =
    [
      nixosModules.sddm-sugar-dark
    ];

  services.displayManager.sddm.greeters.sugar-dark = {
    background = null;
    interface.forceHideCompletePassword = true;
  };
}
