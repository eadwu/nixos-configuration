{ flakes, options, config, pkgs, lib, modulesPath, ... }:

let
  queryLimit = toString (1024 * 1024);
in
{
  environment.systemPackages = with pkgs; [ victoriametrics ];

  services.victoriametrics.enable = true;
  services.victoriametrics.listenAddress = "127.0.0.1:8428";
  services.victoriametrics.retentionPeriod = 1200; # 100 years
  services.victoriametrics.extraOptions = [
    # Compatible metric names ... so it can be accessed without hacks
    # Replaces `.` with `_` - which is not great...
    # "-usePromCompatibleNaming"
    # Log own metrics
    "-selfScrapeInterval=10s"
    # Limit memory (internal cache) usage to 8%
    "-memory.allowedPercent=8"
    "-sortLabels"
    # Don't polyfill any gaps bigger
    "-search.setLookbackToStep"
    # Remove query limits outside of auto-kills
    # "-search.maxUniqueTimeseries=${queryLimit}"
    # "-search.maxSamplesPerSeries=${queryLimit}"
    # "-search.maxSamplesPerQuery=${queryLimit}"
    # "-search.maxPointsPerTimeseries=${queryLimit}"
    # "-search.maxPointsSubqueryPerTimeseries=${queryLimit}"
    # "-search.maxSeries=${queryLimit}"
    # "-search.maxTagKeys=${queryLimit}"
    # "-search.maxTagValues=${queryLimit}"
    # "-search.maxTagValueSuffixesPerSearch=${queryLimit}"
  ];

  # Give it 2m at most to gracefully stop
  systemd.services.victoriametrics.serviceConfig.KillSignal = "SIGINT";
  systemd.services.victoriametrics.serviceConfig.TimeoutStopSec = "4m";
  systemd.services.victoriametrics.serviceConfig.MemoryAccounting = true;
  systemd.services.victoriametrics.serviceConfig.MemoryHigh = "25%"; # 10%
  systemd.services.victoriametrics.serviceConfig.MemoryMax = "50%"; # 25%

  # nixpkgs.overlays = [ (final: prev: {
  #   victoriametrics = prev.victoriametrics.overrideAttrs (oldAttrs:
  #     {
  #       version = flakes.victoriametrics.version;
  #       src = flakes.victoriametrics.path;

  #       doCheck = false;
  #     });
  # }) ];

  # systemd.services.victoriametrics-staging.serviceConfig.MemoryAccounting = true;
  # systemd.services.victoriametrics-staging.serviceConfig.MemoryHigh = "2%";
  # systemd.services.victoriametrics-staging.serviceConfig.MemoryMax = "5%";
  systemd.services.victoriametrics-staging = {
    description = "VictoriaMetrics time series database (Staging Grounds)";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    startLimitBurst = 5;

    serviceConfig = {
      Restart = "on-failure";
      RestartSec = 1;
      PrivateTmp = true;
      DynamicUser = true;
      ExecStart = ''
        ${config.services.victoriametrics.package}/bin/victoria-metrics \
            -storageDataPath=/tmp/victoriametrics \
            -httpListenAddr=127.0.0.1:8429 \
            -retentionPeriod=2 \
            -selfScrapeInterval=10s \
            -sortLabels
      '';
      LimitNOFILE = 1048576;
    };
  };
}
