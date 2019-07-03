{ pkgs, ... }:

{
  imports =
    [
      ../../../../options/sddm-sugar-dark.nix
    ];

  services.xserver.displayManager.sddm.greeters.sugar-dark = {
    background = pkgs.requireFile {
      name = "video-bg.3e78e808.mp4";
      sha256 = "0c7nvbpbigxcjgqd93038lvkba4z9q0g21jkhr4qwqj0alq026zh";
      message = ''
        video-bg.3e78e808.mp4 is missing from /nix/store.
      '';
    };

    interface.forceHideCompletePassword = true;
  };
}
