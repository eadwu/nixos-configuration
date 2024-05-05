{ options, config, pkgs, lib, modulesPath, ... }:

{
  systemd.services.loki.serviceConfig.StateDirectory = "loki";

  services.loki.enable = true;
  services.loki.dataDir = "/run/loki";
  services.loki.configuration = {
    auth_enabled = false;

    server.http_listen_port = 3100;

    ingester = {
      lifecycler = {
        address = "127.0.0.1";
        ring = {
          kvstore.store = "inmemory";
          replication_factor = 1;
        };
        final_sleep = "0s";
      };
      chunk_idle_period = "5m";
      chunk_retain_period = "30s";
    };

    schema_config = {
      configs = [
        { from = "2020-05-15";
          store = "boltdb";
          object_store = "filesystem";
          schema = "v11";
          index = {
            prefix = "index_";
            period = "168h";
          }; }
      ];
    };

    storage_config = {
      boltdb.directory = "/tmp/loki/index";
      filesystem.directory = "/tmp/loki/chunks";
    };

    limits_config = {
      enforce_metric_name = false;
      reject_old_samples = true;
      reject_old_samples_max_age = "168h";
    };
  };

  systemd.services.promtail.serviceConfig.RuntimeDirectory = "promtail";

  # services.promtail.enable = true;
  services.promtail.configuration = {
    server = {
      disable = false;
      http_listen_address = "127.0.0.1";
      http_listen_port = 9080;
      grpc_listen_address = "127.0.0.1";
      grpc_listen_port = 9081;

      register_instrumentation = true;
      log_level = "info";
      enable_runtime_reload = false;
    };

    positions = {
      filename = "/run/promtail/positions.yml";
      ignore_invalid_yaml = false;
    };

    clients = with config.services.loki.configuration; [ { 
      url = "http://${server.http_listen_address}:${toString server.http_listen_port}/loki/api/v1/push"; 
    }];

    scrape_configs = [
      {
        job_name = "dnstap";

        pipeline_stages = [
          { json.expressions = {
            #
          }; }
        ];

        journal = {
          max_age = "12h";
          labels.source = "dnstap";

          relabel_configs = [
            {
              action = "keep";
              source_labels = [ "__journal__systemd_unit" ];
              regex = "dnstap.service";
            }
            {
              source_labels = [ "__journal__systemd_unit" ];
              target_label = "unit";
            }
          ];
        };
      }
    ];
  };
}