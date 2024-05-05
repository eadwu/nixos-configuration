{ flakes, options, config, pkgs, lib, modulesPath, ... }@args:

# AlphaVantage 50Y9NPX28OW72QZM
# AlphaVantageIntradayRotationKey1 VY56GC1YAW3ID6OL
# AlphaVantageIntradayRotationKey2 W3K560AV5DIJRDXW
# AlphaVantageIntradayRotationKey3 GRQ0EGHO45DP7LAM
# AlphaVantageIntradayRotationKey4 6TXC770YEKYQMXGF

# Partitions ...
# year1month1, year1month2, ..., year1month11, year1month12, year2month1, ..., year2month11, year2month12

# alphavantage@NVDA-year1month1-50Y9NPX28OW72QZM

let
  substituteScript = { referenceConfig, runtimeDirectory }: 
    pkgs.writeShellScriptBin "telegraf-alphavantage" ''
      # Format is TICKER-PARTITION-APIKEY
      ticker="''${1%%-*}" # Remove longest match of -* from end
      partition_api_key="''${1#*-}" # Remove shortest *- from beginning
      partition="''${partition_api_key%%-*}" # Remove longest -* from end
      api_key="''${1##*-}" # Remove longest *- from beginning

      config="${runtimeDirectory}/$ticker.toml"

      sed \
        -e "s|@TICKER@|$ticker|g" \
        -e "s|@PARTITION@|$partition|g" \
        -e "s|@APIKEY@|$api_key|g" \
        ${referenceConfig} > "$config"
      ${pkgs.telegraf}/bin/telegraf --once -config "$config"
    '';

  tomlGenerator = pkgs.formats.toml {};
  telegrafConfGenerator = tomlGenerator.generate "config.toml";
in {
  systemd.services."alphavantage@" = rec {
    wants = [ "apache-kafka.service" "network-online.target" ];
    after = [ "apache-kafka.service" "network-online.target" "nss-lookup.target" ] ;

    description = "Fetch Historical Intraday Stock Information from AlphaVantage";
    serviceConfig.RuntimeDirectory = "telegraf-alphavantage";
    serviceConfig.ExecStart = "${substituteScript {
      referenceConfig = telegrafConfGenerator (import ./config/alphavantage/intraday.nix args);
      runtimeDirectory = "/run/${serviceConfig.RuntimeDirectory}";
    }}/bin/telegraf-alphavantage %i";
  };
}
