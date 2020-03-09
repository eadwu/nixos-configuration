{ config, pkgs, ... }:

{
  programs.ccache.enable = true;
  nix.sandboxPaths = [ config.programs.ccache.cacheDir ];
}
