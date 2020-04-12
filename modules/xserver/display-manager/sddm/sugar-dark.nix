{ pkgs, ... }:

{
  imports =
    [
      ../../../../options/sddm-sugar-dark.nix
    ];

  services.xserver.displayManager.sddm.greeters.sugar-dark = {
    background = (
      pkgs.requireFile rec {
        name = "2008331319.mp4";
        sha256 = "0idmb03dqrry04224mgmkjndai0696iihrgfdpr7ackvpzcwlzzf";
        message = "${name} is missing from NIX_STORE.";
      }
    ).overrideAttrs (_: { allowSubstitutes = true; });

    interface.forceHideCompletePassword = true;
  };
}
