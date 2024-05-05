config:

rec {
  agent = {
    interval = "300s";
    round_interval = true; # Keep deterministic, i.e. :10, :20

    metric_batch_size = 8192 * 4;
    metric_buffer_limit = agent.metric_batch_size * 8 * 4;

    flush_interval = "1200s"; # Don't flush unnecessarily (<= metric_batch_size)

    debug = true;
  };

  inputs.internal = [{
    alias = "telegraf";
    tags = { metric_source = "telegraf"; telegraf-instance = "bridge"; };
    collect_memstats = true;
  }];

  inputs.kafka_consumer = [{
    alias = "kafka_bridge";
    brokers = with config.services.apache-kafka; ["127.0.0.1:9092"];
    topics = [ config.networking.hostName ];
    # zstd compression support
    version = "2.1.0";
    max_message_len = 0;
    max_undelivered_messages = agent.metric_buffer_limit * 2;
    data_format = "influx";
  }];

  /*
  # Add noise to pseudo-anonymize results
  processors.noise = [{
    type = "laplacian";
    # type = "guassian";
    # type = "uniform";

    # Laplacian and Guassian distributions
    mu = 0.0;
    scale = 1.0;

    # Uniform distribution
    min = -1.0;
    max = 1.0;
  }];
  */

  /*
  outputs.http = [
    {
      alias = "m3db";
      # urls = [ "http://localhost:7201/api/v1/influxdb/write" ];
      url = "http://localhost:7201/api/v1/influxdb/write";
      data_format = "influx";
      # skip_database_creation = true;
    }
  ];
  */

  # outputs.file = [
  #   {
  #     alias = "stdout";
  #     files = ["/tmp/bridge.out"];
  #     data_format = "influx";

  #     tagexclude = [
  #       "db" # Telegraf added tag `db=telegraf`
  #       "url" # Extra cardinality for no reason
  #       "__internal_metric_type"
  #     ];

  #     # Don't push test metrics to production store
  #     tagdrop = {
  #       __internal_metric_type = [ "test" "internal" ];
  #     };
  #   }
  # ];

  outputs.influxdb = [
    # {
    #   urls = [ "http://localhost:8007/api/v1/push/influx" ];
    #   data_format = "influx";
    #   skip_database_creation = true;
    # }

    {
      alias = "victoriametrics_production";
      urls = [ "http://localhost:8428" ];
      data_format = "influx";
      skip_database_creation = true;

      tagexclude = [
        "db" # Telegraf added tag `db=telegraf`
        "url" # Extra cardinality for no reason
        "__internal_metric_type"
      ];

      # Don't push test metrics to production store
      tagdrop = {
        __internal_metric_type = [ "test" "internal" ];
      };
    }

    /*
    {
      alias = "victoriametrics_cluster";
      urls = [ "http://localhost:8480" ];
      data_format = "influx";
      skip_database_creation = true;

      tagexclude = [
        "db" # Telegraf added tag `db=telegraf`
        "url" # Extra cardinality for no reason
        "__internal_metric_type"
      ];

      # Don't push test metrics to production store
      tagdrop = {
        __internal_metric_type = [ "test" "internal" ];
      };
    }
    */

    {
      alias = "victoriametrics_staging";
      urls = [ "http://localhost:8429" ];
      data_format = "influx";
      skip_database_creation = true;

      tagexclude = [
        "db" # Telegraf added tag `db=telegraf`
        "url" # Extra cardinality for no reason
        "__internal_metric_type"
      ];

      # Don't push test metrics to production store
      tagdrop = {
        __internal_metric_type = [ "test" "internal" ];
      };
    }
  ];

  /*
  # Be careful - https://github.com/influxdata/telegraf/issues/11682
  outputs.http = [{
    # https://grafana.com/docs/mimir/latest/operators-guide/reference-http-api/#remote-write
    alias = "mimir";
    url = "http://localhost:9009/api/v1/push";

    # use_batch_format = false;
    use_batch_format = true;
    data_format = "prometheusremotewrite";

    timeout = "20s";

    headers = {
      Content-Type = "application/x-protobuf";
      Content-Encoding = "snappy";
      X-Prometheus-Remote-Write-Version = "0.1.0";
      # X-Mimir-SkipLabelNameValidation = "true";
    };

    non_retryable_statuscodes = [ 400 ];
  }];
  */

  /*
  outputs.influxdb_v2 = [{
    alias = "influxdb2_kresd";
    urls = [ "http://localhost:8086" ];
    token = "EXU2-dKYv8i5APx44gH5FgjSxT8qT_K6TeukauSShBCrQt5_YD3FXxuABjPNBFe-nV5fKfVbdO0yxaal41fJFA==";
    organization = "root";
    bucket = "knot-resolver";
    tagexclude = [ "metric_source" ];
    tagpass = { metric_source = [ "kresd" ]; };
  } {
    alias = "influxdb2_netdata";
    urls = [ "http://localhost:8086" ];
    token = "EXU2-dKYv8i5APx44gH5FgjSxT8qT_K6TeukauSShBCrQt5_YD3FXxuABjPNBFe-nV5fKfVbdO0yxaal41fJFA==";
    organization = "root";
    bucket = "netdata";
    tagexclude = [ "metric_source" ];
    tagpass = { metric_source = [ "netdata" ]; };
  } {
    alias = "influxdb2_windows";
    urls = [ "http://localhost:8086" ];
    token = "EXU2-dKYv8i5APx44gH5FgjSxT8qT_K6TeukauSShBCrQt5_YD3FXxuABjPNBFe-nV5fKfVbdO0yxaal41fJFA==";
    organization = "root";
    bucket = "wsl_host";
    tagexclude = [ "metric_source" ];
    tagpass = { metric_source = [ "windows" "windows_exporter" "nvidia_win" "ohm" ]; };
  } {
    alias = "influxdb2_ohm";
    urls = [ "http://localhost:8086" ];
    token = "EXU2-dKYv8i5APx44gH5FgjSxT8qT_K6TeukauSShBCrQt5_YD3FXxuABjPNBFe-nV5fKfVbdO0yxaal41fJFA==";
    organization = "root";
    bucket = "ohm";
    tagexclude = [ "metric_source" ];
    tagpass = { metric_source = [ "ohm" ]; };
  } {
    timeout = "20s";

    alias = "influxdb2_internal";
    urls = [ "http://localhost:8086" ];
    token = "EXU2-dKYv8i5APx44gH5FgjSxT8qT_K6TeukauSShBCrQt5_YD3FXxuABjPNBFe-nV5fKfVbdO0yxaal41fJFA==";
    organization = "root";
    bucket = "influxdb";
    tagexclude = [ "metric_source" ];
    tagpass = { metric_source = [ "influxdb2" ]; };
  } {
    timeout = "20s";

    alias = "influxdb2_all";
    urls = [ "http://localhost:8086" ];
    token = "EXU2-dKYv8i5APx44gH5FgjSxT8qT_K6TeukauSShBCrQt5_YD3FXxuABjPNBFe-nV5fKfVbdO0yxaal41fJFA==";
    organization = "root";
    bucket = "all";
  }];
  */

  /*
  outputs.prometheus_client = [{
    metric_buffer_limit = 126976 * 16; #65536; # 16384 126976
    flush_interval = "600s";
     listen = "127.0.0.1:9273";
     metric_version = 1;
     path = "/metrics";
     #ip_range = [ "192.168.0.0/24" ];
     #export_timestamp = false;
  }];
  */
}
