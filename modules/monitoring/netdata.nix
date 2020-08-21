{ ... }:

{
  services.netdata.enable = true;

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
