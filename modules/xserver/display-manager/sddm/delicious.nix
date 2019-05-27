{ ... }:

{
  imports =
    [
      ../../../../options/sddm-delicious.nix
    ];

  services.xserver.displayManager.sddm.greeters.delicious = {
    sessions = [ "dwm" ];
  };
}
