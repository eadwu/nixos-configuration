{ options, config, pkgs, lib, modulesPath, ... }:

{
  environment.systemPackages = with pkgs; [ jq ];

  services.chrony.enable = true;
  # Needs DNS resolution
  systemd.services.chronyd.wants = [ "network-online.target" ];
  systemd.services.chronyd.after = [ "network-online.target" "nss-lookup.target" ] ;

  imports =
    [
      ./modules/grafana.nix
      # ./modules/influxdb.nix
      ./modules/kafka.nix
      # # ./modules/loki.nix
      # ./modules/mimir.nix
      ./modules/netdata.nix
      # ./modules/ohmgraphite.nix
      # # ./modules/victoriametrics.nix
      ./modules/telegraf
      # ./modules/windows_exporter.nix
    ];

  # Kafka as an intermediate event store
  systemd.services.telegraf.after = [ "apache-kafka.service" ];
  # nix-shell -p apacheKafka --run 'kafka-storage.sh random-uuid'
  services.apache-kafka.clusterId = "MNa_U7AzQ0Ok9WYPZ1eyNg";
  services.apache-kafka.formatLogDirs = true;
  services.apache-kafka.formatLogDirsIgnoreFormatted = true;
  systemd.services.apache-kafka = let
    kafka-config = pkgs.writeText "server.properties" config.services.apache-kafka.configFiles.serverProperties;
  in {
    environment = {
      KAFKA_OPTS = "-Djava.net.preferIPv4Stack=True";
      KAFKA_JMX_OPTS = lib.concatStringsSep " " [
        "-Dcom.sun.management.jmxremote=true"
        "-Dcom.sun.management.jmxremote.ssl=false"
        "-Dcom.sun.management.jmxremote.authenticate=false"
        # "-Djava.rmi.server.hostname=127.0.0.1"
        "-Dcom.sun.management.jmxremote.local.only=true"
        "-Dcom.sun.management.jmxremote.host=127.0.0.1"
        "-Dcom.sun.management.jmxremote.port=9090"
      ];
    };

    # serviceConfig.ExecStart = lib.mkForce "${pkgs.apacheKafka}/bin/kafka-server-start.sh ${kafka-config}";

    # preStart = let
    #   kafka-storage = "${pkgs.apacheKafka}/bin/kafka-storage.sh";
    #   KAFKA_CLUSTER_ID = ''$(${kafka-storage} random-uuid)'';
    # in ''
    #   ${kafka-storage} format --ignore-formatted \
    #     --cluster-id ${KAFKA_CLUSTER_ID} --config ${kafka-config}
    # '';
  };

  services.grafana.provision.dashboards.settings = {
    apiVersion = 1;
    providers = [{
      name = "Frontend";
      options.path = ../../modules/monitoring/dashboards/general;
    } {
      name = "VictoriaMetrics";
      options.path = ../../modules/monitoring/dashboards/victoriametrics;
    }];
  };

  services.grafana.provision.datasources.settings = {
    apiVersion = 1;
    datasources = [
    /*
    {
      name = "mimir";
      type = "prometheus";
      url = "http://localhost:9009/prometheus";
      # jsonDate.timeInterval = "15s";
      jsonData.httpMode = "POST";
      jsonData.prometheusType = "Mimir";
    }
    */
    {
      name = "victoriametrics";
      type = "prometheus";
      url = "http://localhost:8428";
      # jsonDate.timeInterval = "15s";
      jsonData.httpMode = "POST";
      jsonData.prometheusType = "Prometheus";
    }
    {
      name = "victoriametrics-staging";
      type = "prometheus";
      url = "http://localhost:8429";
      # jsonDate.timeInterval = "15s";
      jsonData.httpMode = "POST";
      jsonData.prometheusType = "Prometheus";
    }
    /*
    {
      name = "knot-resolver";
      type = "influxdb";
      url = "http://localhost:8086";
      database = "knot-resolver";
      user = "influxdb2";
      jsonData.httpMode = "GET";
      jsonData.httpHeaderName1 = "Authorization";
      secureJsonData.httpHeaderValue1 = "Token 6JXJLEU-GOvOc_QK_N1ZruKkIxcBlQrVgtiLPnjE4iI7ajEQaE0_KZRQKJxKNYaizBYsDh2cZjHaElJgjlUuoQ==";
    } {
      name = "netdata";
      type = "influxdb";
      url = "http://localhost:8086";
      database = "netdata";
      user = "influxdb2";
      jsonData.httpMode = "GET";
      jsonData.httpHeaderName1 = "Authorization";
      secureJsonData.httpHeaderValue1 = "Token 6JXJLEU-GOvOc_QK_N1ZruKkIxcBlQrVgtiLPnjE4iI7ajEQaE0_KZRQKJxKNYaizBYsDh2cZjHaElJgjlUuoQ==";
    } {
      name = "wsl_host";
      type = "influxdb";
      url = "http://localhost:8086";
      database = "wsl_host";
      user = "influxdb2";
      jsonData.httpMode = "GET";
      jsonData.httpHeaderName1 = "Authorization";
      secureJsonData.httpHeaderValue1 = "Token 6JXJLEU-GOvOc_QK_N1ZruKkIxcBlQrVgtiLPnjE4iI7ajEQaE0_KZRQKJxKNYaizBYsDh2cZjHaElJgjlUuoQ==";
    } {
      name = "influxdb2-influxql";
      type = "influxdb";
      url = "http://localhost:8086";
      database = "all";
      user = "influxdb2";
      jsonData.httpMode = "GET";
      jsonData.httpHeaderName1 = "Authorization";
      secureJsonData.httpHeaderValue1 = "Token 6JXJLEU-GOvOc_QK_N1ZruKkIxcBlQrVgtiLPnjE4iI7ajEQaE0_KZRQKJxKNYaizBYsDh2cZjHaElJgjlUuoQ==";
    }
    */
    ];
  };
}
