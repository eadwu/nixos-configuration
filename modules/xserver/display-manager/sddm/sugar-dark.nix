{ pkgs, ... }:

{
  imports =
    [
      ../../../../options/sddm-sugar-dark.nix
    ];

  services.xserver.displayManager.sddm.greeters.sugar-dark = {
    background = (
      pkgs.requireFile rec {
        name = "Scissors-Congruence_2880x1620-Lede.mp4";
        sha256 = "1dwxd0hx2mbxr0sd0yjpvygy2l0fpv135is2qgrcbqs22jx57f7y";
        message = "${name} is missing from NIX_STORE.";
      }
    ).overrideAttrs (_: { allowSubstitutes = true; });

    interface.forceHideCompletePassword = true;
  };
}
