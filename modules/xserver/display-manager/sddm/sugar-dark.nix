{ ... }:

{
  imports =
    [
      ../../../../options/sddm-sugar-dark.nix
    ];

  services.xserver.displayManager.sddm.greeters.sugar-dark = {
    interface.forceHideCompletePassword = true;
  };
}
