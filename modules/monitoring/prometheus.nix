{ config, ... }:

{
  services.prometheus = {
    enable = true;
    listenAddress = "127.0.0.1:9090";

    globalConfig = {
      scrape_interval = "1s";
      evaluation_interval = "1s";
    };

    scrapeConfigs = [
      ({
        job_name = "prometheus";
        static_configs = [ { targets = [ config.services.prometheus.listenAddress ]; } ];
      })

      ({
        job_name = "postgres";
        static_configs = [ { targets = [ "localhost:9187" ]; } ];
      })

      ({
        job_name = "node";
        static_configs = [ { targets = [ "localhost:9100" ]; } ];
      })
    ];
  };

  services.prometheus.exporters.postgres = {
    enable = true;
    openFirewall = false;
    listenAddress = "127.0.0.1";
    runAsLocalSuperUser = true;
  };

  services.prometheus.exporters.node = {
    enable = true;
    openFirewall = false;
    listenAddress = "127.0.0.1";
    enabledCollectors = [
      "buddyinfo"
      "interrupts"
      "ksmd"
      "logind"
      "mountstats"
      "processes"
      "qdisc"
      "systemd"
      "wifi"
    ];
    disabledCollectors = [
      "textfile"
    ];
  };

  # Grafana Integration
  services.grafana.provision.datasources = [
    ({
      name = "prometheus";
      type = "prometheus";
      url = "http://${config.services.prometheus.listenAddress}";
    })
  ];
}
