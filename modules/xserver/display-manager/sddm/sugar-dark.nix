{ pkgs, ... }:

{
  imports =
    [
      ../../../../options/sddm-sugar-dark.nix
    ];

  services.xserver.displayManager.sddm.greeters.sugar-dark = {
    background = (
      pkgs.requireFile rec {
        name = "fox.mp4";
        sha256 = "1iapswbz59ii48iq1d7sp2c9236m0bixlh31qvvy8wfv609892aw";
        message = "${name} is missing from NIX_STORE.";
      }
    ).overrideAttrs (_: { allowSubstitutes = true; });

    interface.forceHideCompletePassword = true;
  };
}
