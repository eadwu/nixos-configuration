{ pkgs, ... }:

{
  imports =
    [
      ../../../../options/sddm-sugar-dark.nix
    ];

  services.xserver.displayManager.sddm.greeters.sugar-dark = {
    background = (
      pkgs.requireFile rec {
        name = "video-bg.3e78e808.mp4";
        sha256 = "0c7nvbpbigxcjgqd93038lvkba4z9q0g21jkhr4qwqj0alq026zh";
        message = "${name} is missing from NIX_STORE.";
      }
    ).overrideAttrs (_: { allowSubstitutes = true; });

    interface.forceHideCompletePassword = true;
  };
}
