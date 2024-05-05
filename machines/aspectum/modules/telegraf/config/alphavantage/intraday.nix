{ config, ... }:

{
  agent = config.services.telegraf.extraConfig.agent;

  /*
  inputs.internal = [{
    alias = "telegraf";
    tags = { metric_source = "telegraf"; telegraf-instance = "alphavantage"; };
    collect_memstats = true;
  }];
  */

  inputs.http = [{
    alias = "alphavantage_intraday";

    name_override = "security";
    tags = {
      security = "stock";
      metric_source = "alphavantage";
      symbol = "@TICKER@";
      collapse = "minute";
    };

    urls = [
      # "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&interval=1min&outputsize=full&datatype=csv&symbol=@TICKER@&apikey=@APIKEY@"
      "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY_EXTENDED&interval=1min&adjusted=false&symbol=@TICKER@&slice=@PARTITION@&apikey=@APIKEY@"
    ];
    method = "GET";
    timeout = "1m";

    data_format = "csv";
    # time,open,high,low,close,volume
    # csv_header_row_count = 1;
    csv_skip_rows = 1; # Remove header row
    csv_column_names = [ "Time" "Open" "High" "Low" "Close" "Volume" ];
    # Supported types: "int", "float", "bool", "string".
    csv_column_types = [ "string" "float" "float" "float" "float" "int" ];

    csv_delimiter = ",";

    csv_timestamp_column = "Time";
    csv_timestamp_format = "2006-01-02 15:04:05";
    csv_timezone = "America/New_York";
  }];

  outputs.kafka = [{
    alias = "kafka_bridge";
    brokers = with config.services.apache-kafka; ["127.0.0.1:9092"];
    topic = config.networking.hostName;
    # topic_tag = "metric_source";
    # exclude_topic_tag = true;
    routing_tag = "host";
    required_acks = -1;
    max_retry = 4;
    data_format = "influx";
    # zstd compression support
    version = "2.1.0";
    compression_codec = 4;
  }];
}
