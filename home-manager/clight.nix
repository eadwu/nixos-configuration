{ config, pkgs, lib, ... }:

{
  home.file = with lib;
    listToAttrs (map
      (module: nameValuePair
        (config.xdg.dataHome + "/clight/modules.d/${module}")
        ({ source = pkgs.clight-modules.${module} + "/share/clight/modules.d/${module}"; }))
      [ "inhibit_bl" "trendlog" ]);
}
