{ flakes, options, config, pkgs, lib, modulesPath, ... }@args:

let
  # At least once a week, ideally during non-peak electrical hours
  # California ~ 9 AM - 4 PM ish, 9 PM - 12 AM
  #   Peak hours: 4-9 p.m. every day
  # New York ~ midnight to 8 AM, all day weekends
  #   Peak hours (summer): 8 a.m. to Midnight
  timerConfiguration = {
    wantedBy = ["timers.target"];
    timerConfig.Persistent = true;
    timerConfig.OnCalendar = "*-*-1/4 00:00:00"; # Every fourth day, starting from the 1st of each month
    # timerConfig.RandomizedDelaySec = 60 * 60 * 4; # Spread over 1 hours
  };

  substituteTickerScript = { referenceConfig, runtimeDirectory }:
    pkgs.writeShellScriptBin "telegraf-nasdaq-ticker" ''
      ticker="$1"
      config="/tmp/$ticker.toml"

      sed "s|@TICKER@|$ticker|g" ${referenceConfig} > "$config"
      ${pkgs.telegraf}/bin/telegraf --once -config "$config"
    '';

  tomlGenerator = pkgs.formats.toml {};
  telegrafConfGenerator = tomlGenerator.generate "config.toml";
in {
  # systemd.targets.nasdaq = {
  #   wantedBy = [ "default.target" ];
  #   wants = [ "company-tickers.timer" ]
  #     ++ (map (ticker: "nasdaq-historical@${ticker}.timer") [ "AAPL" "MSFT" "NVDA" "NFLX" ]);
  # };

  /*
  # NOTE: REFACTOR
  # systemd.timers.company-tickers = {
  #   wantedBy = ["timers.target"];
  #   timerConfig.Persistent = true;
  #   timerConfig.OnCalendar = "Mon..Fri"; # Trading is only open weekdays...
  # };
  systemd.services.company-tickers = {
    wants = [ "apache-kafka.service" "network-online.target" ];
    after = [ "apache-kafka.service" "network-online.target" "nss-lookup.target" ] ;

    description = "Fetch List of Company [Tickers]";
    serviceConfig.RuntimeDirectory = "telegraf-nasdaq";

    script = ''
      ${pkgs.telegraf}/bin/telegraf --once \
        -config ${telegrafConfGenerator (import ./config/nasdaq/list.nix config)}
    '';
  };
  */

  systemd.services."nasdaq-historical@" = rec {
    wants = [ "apache-kafka.service" "network-online.target" ];
    after = [ "apache-kafka.service" "network-online.target" "nss-lookup.target" ] ;

    description = "Fetch Historical Stock Information (Day, Weekly, Monthly)";
    serviceConfig.RuntimeDirectory = "telegraf-nasdaq";
    serviceConfig.ExecStart = "${substituteTickerScript {
      referenceConfig = telegrafConfGenerator (import ./config/nasdaq/historical.nix args);
      runtimeDirectory = "$RUNTIME_DIRECTORY";
    }}/bin/telegraf-nasdaq-ticker %i";
    serviceConfig.PrivateTmp = true;
  };

  systemd.timers.nasdaq-historical = {
    wantedBy = ["timers.target"];
    timerConfig.OnActiveSec = "60s"; # Start 60 seconds after timer is started
    # Every [2, 6] seconds from deactivation
    timerConfig.OnUnitInactiveSec = "2s";
    timerConfig.RandomizedDelaySec = "4s";
  };
  systemd.services.nasdaq-historical = {
    wants = [ "victoriametrics.service" ];
    after = [ "victoriametrics.service" ];

    description = "One-shot historical launcher";

    path = with pkgs; [ jq curl coreutils config.systemd.package ];
    # jq -r '.data.result | map(select(.metric.Valid == "1")) | sort_by(.value[1]) | .[0].metric.Symbol'
    script = ''
      NOW="$(date +%s)"

      # Query results with `max by (Symbol) (timestamp.last_nasdaq_check)`
      # Fetch results before filtering out only valid ticker symbols
      # Retrieves the next ticker to run - the ticker that needs to be refreshed the latest
      get_last_ticker() {
        OFFSET="$1"

        MIN_DELAY=$(( 24 * 60 * 60 )) # 24 hours - 60 minutes per hour - 60 seconds per hour
        MIN_TIMESTAMP="$(( $NOW - $MIN_DELAY ))"

        # map(select(.value[1] | tonumber <= $MIN_TIMESTAMP)) ?

        curl --silent "http://localhost:8428/api/v1/query?query=max%20by(Symbol)%20(timestamp.last_security_check)&step=365d" | \
          jq -r ".data.result | sort_by(.value[1]) | map(select(.metric.Symbol != \"null\")) | .[$OFFSET].metric.Symbol"
      }

      LAST_TICKER_FILE="$CACHE_DIRECTORY/last_ticker"
      if [ ! -f "$LAST_TICKER_FILE" ];
      then
        touch "$LAST_TICKER_FILE"
      fi

      LAST_TICKER="$(cat $LAST_TICKER_FILE)"
      TICKER="$(get_last_ticker 0)"

      index=0
      while [ "$TICKER" = "$LAST_TICKER" ];
      do
        TICKER="$(get_last_ticker $index)"
        index="$(( index + 1 ))"
      done

      SYSTEMD_SERVICE="nasdaq-historical@$TICKER.service"

      # Ack ticker
      printf "%s" "$TICKER" > "$LAST_TICKER_FILE"

      # Generate line protocol to update timestamp
      printf "timestamp.last_security,Valid=1,Symbol=%s,host=aspectum check=%di" "$TICKER" "$NOW" | \
        curl -d @- -X POST "http://localhost:8428/write"

      # Run script to generate results
      systemctl restart "$SYSTEMD_SERVICE"

      # Wait for service to finish
      while [ "$(systemctl show "$SYSTEMD_SERVICE" --property=SubState | sed 's@^SubState=@@')" = "running" ];
      do
        sleep 1
      done
    '';

    serviceConfig.CacheDirectory = "nasdaq-historical";
  };
}
