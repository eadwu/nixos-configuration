{ config, pkgs, ... }:

let
  compileModule = import ./clight/compileModule.nix;
in
{
  home.file."${config.xdg.dataHome}/clight/modules.d/inhibit_bl".source =
    "${compileModule {
      name = "inhibit_bl";
      src = ./clight/inhibit_bl.c;
    } { inherit (pkgs) stdenv clight libmodule; }}/share/clight/modules.d/inhibit_bl";
}
