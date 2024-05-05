{ options, config, pkgs, lib, modulesPath, ... }:

let
  temporaryDirectory = "/tmp/mimir";
  stateDirectory = "/var/lib/mimir";
in {
  # services.kubernetes.enable = true;
  # services.kubernetes.roles = [ "master" "node" ];

  security.polkit.enable = config.virtualisation.libvirtd.enable;
  virtualisation.libvirtd.enable = true; # Virtual machine provider
  users.users.${config.networking.hostName}.extraGroups = [ "libvirtd" ];

  environment.systemPackages = with pkgs; [ 
    mimir
    minio-client 

    # prometheus # promtool

    tanka
  ];

  # Object storage
  services.minio.enable = true;
  services.minio.listenAddress = "127.0.0.1:9000";
  services.minio.consoleAddress = "127.0.0.1:9001";
  services.minio.region = "us-east-1";

  services.minio.accessKey = "minioadmin";
  services.minio.secretKey = "minioadmin";

  systemd.services.mimir.serviceConfig.PrivateTmp = true;
  systemd.services.mimir.serviceConfig.StateDirectory = "mimir";
  services.mimir.enable = true;
  services.mimir.configuration = {
    multitenancy_enabled = false;

    # api.skip_label_name_validation_header_enabled = true;

    common.storage = {
      backend = "s3";

      filesystem.dir = "${stateDirectory}";
      s3.bucket_name = "mimir";

      s3.endpoint = "127.0.0.1:9000";
      # s3.region = "us-east";
      s3.secret_access_key = "minioadmin";
      s3.access_key_id = "minioadmin";
      s3.insecure = true;
    };

    limits = rec {
      ingestion_rate = 1024 * 16 * 16;
      ingestion_burst_size = ingestion_rate * 16;
      max_global_series_per_user = 0;

      # Retain everything
      compactor_blocks_retention_period = "0s";

      # ...
      # creation_grace_period = "24h0m0s"; # 1-day to not crap out on timezone difference
      out_of_order_time_window = "1048576h0m0s";
      max_cache_freshness = "1048576h0m0s";

      # TSDB Block Upload
      # compactor_block_upload_enabled = true;

      max_label_name_length = 1024 * 1024;
      max_label_value_length = 1024 * 1024;
      max_metadata_length = 1024 * 1024;
      max_label_names_per_series = 1024 * 1024;
    };

    alertmanager = {
      data_dir = "${temporaryDirectory}/data-alertmanager";
    };

    alertmanager_storage = {
      filesystem.dir = "${stateDirectory}/alertmanager";
      s3.bucket_name = "mimir-alertmanager";
    };

    blocks_storage = {
      filesystem.dir = "${stateDirectory}/data/tsdb";
      s3.bucket_name = "mimir-blocks";

      # Should actually probably be in stateDirectory but so flaky on unclean shutdowns
      bucket_store.sync_dir = "${temporaryDirectory}/tsdb-sync"; # Improve start-up time
      tsdb.dir = "${temporaryDirectory}/tsdb";
    };

    compactor = {
      data_dir = "${temporaryDirectory}/compactor";

      # 2 hours - half day - day - week - *4 ~ month - *13 year
      block_ranges = [
        # "2m0s"
        # "10m0s"
        # "30m0s"
        # "1h0m0s"
        "2h0m0s"
        "12h0m0s"
        "24h0m0s"
        "168h0m0s"
        "672h0m0s"
        "8736h0m0s"
      ];

      sharding_ring = {
        instance_addr = "127.0.0.1";
        kvstore.store = "memberlist";
      };
    };

    distributor.ring = {
      instance_addr = "127.0.0.1";
      kvstore.store = "memberlist";
    };

    ingester.ring = {
      instance_addr = "127.0.0.1";
      kvstore.store = "memberlist";
      replication_factor = 1;
    };

    ruler = {
      rule_path = "${temporaryDirectory}/ruler";
      ring.instance_addr = "127.0.0.1";
    };

    ruler_storage = {
      filesystem.dir = "${stateDirectory}/rules";
      s3.bucket_name = "mimir-ruler";
    };

    server = {
      http_listen_port = 9009;
      grpc_listen_port = 9094; # 9095
      log_level = "info";
    };

    store_gateway.sharding_ring = {
      replication_factor = 1;
      instance_addr = "127.0.0.1";
    };

    usage_stats.enabled = false;
  };

  systemd.services.influx2cortex = {
    description = "Grafana Influx Line Protocol to Cortex Proxy";
    wantedBy = [ "default.target" ];

    path = with pkgs; [ influx2cortex mimir-proxies ];

    script = ''
      influx2cortex -auth.enable=false \
        -max.request.size.bytes 0 \
        -internalserver.http-listen-address 127.0.0.1 -internalserver.http-listen-port 8081 \
        -server.http-listen-address 127.0.0.1 -server.http-listen-port 8007 -server.grpc-listen-port 8008 \
        -write-endpoint http://localhost:9009/api/v1/push
    '';
  };
}
