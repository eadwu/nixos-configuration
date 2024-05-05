config:

{
  agent = config.services.telegraf.extraConfig.agent;

  global_tags = {
    __internal_metric_type = "test";
  };

  /*
  inputs.internal = [{
    alias = "telegraf";
    tags = { metric_source = "telegraf"; telegraf-instance = "company-tickers"; };
    collect_memstats = true;
  }];
  */

  # https://www.nasdaqtrader.com/trader.aspx?id=symboldirdefs#nasdaq
  inputs.exec = [{
    alias = "nasdaq_listings";
    tags = { metric_source = "nasdaq"; };

    name_override = "nasdaq_listing";
    timeout = "1m";
    commands = [
      "/run/current-system/sw/bin/curl 'ftp://ftp.nasdaqtrader.com/symboldirectory/nasdaqlisted.txt'"
    ];

    data_format = "csv";
    csv_header_row_count = 1;
    csv_delimiter = "|";
    csv_tag_columns = [ "Symbol" ];
  } {
    alias = "nasdaq_other_listings";
    tags = { metric_source = "nasdaq"; };

    name_override = "nasdaq_listing";
    timeout = "1m";
    commands = [
      "/run/current-system/sw/bin/curl 'ftp://ftp.nasdaqtrader.com/symboldirectory/otherlisted.txt'"
    ];

    data_format = "csv";
    csv_header_row_count = 1;
    csv_delimiter = "|";
    csv_tag_columns = [ "Symbol" ];
  }];

  inputs.http = [{
    # https://www.sec.gov/file/company-tickers
    alias = "sec_company_listings";
    tags = { metric_source = "sec"; };

    urls = [ "https://www.sec.gov/files/company_tickers.json" ];
    method = "GET";
    timeout = "1m";

    data_format = "json_v2";
    json_v2 = [{
      measurement_name = "sec_listing";

      object = [{
        path = "@values"; # Convert {key-value} to [key-value]
        tags = [ "ticker" ];
        included_keys = [ "title" ];
      }];
    }];
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
