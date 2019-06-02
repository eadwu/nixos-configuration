{ config, pkgs, ... }:

{
  imports =
    [
      ./modules/edex-ui.nix
    ];

  programs.edex-ui = {
    enable = false;
    shell = "${pkgs.zsh}/bin/zsh";
    cwd = config.home.homeDirectory;
    theme = "chalkboard";
    allowWindowed = true;
  };
}
