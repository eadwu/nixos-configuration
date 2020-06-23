{ pkgs, ... }:

{
  imports =
    [
      ../../../../options/sddm-sugar-dark.nix
    ];

  services.xserver.displayManager.sddm.greeters.sugar-dark = {
    background = (
      pkgs.requireFile rec {
        name = "lumi.webm";
        sha256 = "034cvcxbk93j4zlzdxykdj8clnq5rj803klyi0mqf4dn3hzb8vmy";
        message = "${name} is missing from NIX_STORE.";
      }
    ).overrideAttrs (_: { allowSubstitutes = true; });

    interface.forceHideCompletePassword = true;
  };
}
