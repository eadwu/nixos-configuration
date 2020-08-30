{ ... }:

{
  services.netdata.enable = true;
  services.netdata.config.backend = {
    enabled = "yes";
    type = "opentsdb";
    destination = "127.0.0.1:4242";
  };

  systemd.services.netdata.after = [ "influxdb.service" ];
  services.influxdb = {
    enable = true;
    extraConfig.opentsdb = [{
      enabled = true;
      database = "opentsdb";
      bind-address = ":4242";
    }];
  };

  # Grafana Integration
  systemd.services.grafana.after = [ "influxdb.service" ];
  services.grafana.provision.datasources = [
    ({
      name = "netdata";
      type = "influxdb";
      url = "http://localhost:8086";
      isDefault = true;

      database = "opentsdb";
      user = "influxdb";
    })
  ];

  # Prometheus Integration
  services.prometheus.scrapeConfigs = [
    ({
      job_name = "netdata";
      honor_labels = true;
      metrics_path = "/api/v1/allmetrics";
      static_configs = [ { targets = [ "localhost:19999" ]; } ];
    })
  ];
}
