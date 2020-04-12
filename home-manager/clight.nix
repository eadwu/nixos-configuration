{ config, pkgs, ... }:

{
  home.file."${config.xdg.dataHome}/clight/modules.d/inhibit_bl".source =
    "${pkgs.clight-modules.inhibit_bl}/share/clight/modules.d/inhibit_bl";
}
