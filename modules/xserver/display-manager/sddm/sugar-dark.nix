{ config, pkgs, ... }:

{
  imports =
    [
      ../../../../options/sddm-sugar-dark.nix
    ];

  services.xserver.displayManager.sddm.greeters.sugar-dark = {
    background = pkgs.requireFile {
      name = "Stream.2971.mp4";
      sha256 = "1na6jhqz9zvys7pb185bbjh27cgdgx69zqxf6hjxg0ipycsk8dd8";
      message = ''
        Stream.2971.mp4 is missing from /nix/store.
      '';
    };

    interface.forceHideCompletePassword = true;
  };
}
