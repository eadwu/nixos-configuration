{ config, flakes, ... }:

{
  home.file."${config.xdg.dataHome}/clight/modules.d/inhibit_bl".source =
    "${flakes.external.clight-modules.inhibit_bl}/share/clight/modules.d/inhibit_bl";
}
