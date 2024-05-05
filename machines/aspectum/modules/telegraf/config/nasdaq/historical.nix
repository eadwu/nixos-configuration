{ pkgs, lib, config, ... }:

let
  dateRange = "1900-01-01~2100-01-01";
  timezone = "America/New_York"; # Nasdaq is based in Eastern Time

  ack = pkgs.writeShellScriptBin "nasdaq-historical-ack" ''
    TICKER="$1"

    printf "timestamp.last_nasdaq,Valid=1,Symbol=%s,host=aspectum check=%di" \
      "$TICKER" \
      "$(${pkgs.coreutils}/bin/date +%s)"
  '';

  historicalContexts = [
    /*
    # "Real-time" w/ Pre and After Market data
    {
      alias = "nasdaq_@TICKER@_realtime";
      collapse = "realtime";
      urls = [ "https://api.nasdaq.com/api/quote/@TICKER@/chart?assetClass=stocks&charttype=real&" ];
      included_keys = [ "w" "y" "x" ];
      headers = realtimeHeaders;
      format = realtimeFormat;
      # +1 day shifted or some weird thing
      internal = true;
    }
    */
    # 1-minute intraday
    {
      alias = "nasdaq_@TICKER@_intraday";
      collapse = "minute";
      # &includeLatestIntradayData=1
      urls = [ "https://charting.nasdaq.com/data/charting/intraday?symbol=@TICKER@&mostRecent=5&" ];
      included_keys = [ "Value" "Volume" ];
      headers = historicalHeaders;
      format = historicalFormat;
    }
    # 1-day historical
    (rec {
      alias = "nasdaq_@TICKER@_${collapse}_historical";
      collapse = "day";
      urls = [
        "https://charting.nasdaq.com/data/charting/historical?symbol=@TICKER@&date=${dateRange}&"
      ];
      included_keys = [ "High" "Low" "Open" "Close" "Volume" ];
      headers = historicalHeaders;
      format = historicalFormat;
    })
    # Weekly historical
    (rec {
      alias = "nasdaq_@TICKER@_${collapse}_historical";
      collapse = "week";
      urls = [
        "https://charting.nasdaq.com/data/charting/historical?symbol=@TICKER@&date=${dateRange}&frequencyID=1&includeLatestIntradayData=1&"
      ];
      included_keys = [ "High" "Low" "Open" "Close" "Volume" ];
      headers = historicalHeaders;
      format = historicalFormat;
    })
    # Monthly historical
    (rec {
      alias = "nasdaq_@TICKER@_${collapse}_historical";
      collapse = "month";
      urls = [
        "https://charting.nasdaq.com/data/charting/historical?symbol=@TICKER@&date=${dateRange}&frequencyID=2&includeLatestIntradayData=1&"
      ];
      included_keys = [ "High" "Low" "Open" "Close" "Volume" ];
      headers = historicalHeaders;
      format = historicalFormat;
    })
  ];

  realtimeHeaders = {
    Accept = "*/*";
    Accept-Encoding = "identity";
    Accept-Language = "en-US,en;q=0.9";
    # Host = "www.nasdaq.com";
    # Referer = "https://www.nasdaq.com/";
    Upgrade-Insecure-Requests = "1";
    User-Agent = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36";
  };

  realtimeFormat = { ... }@context: [{
    measurement_name = "security";

    object = [(rec {
      path = "data.chart";
      timestamp_key = "x";
      # timestamp_format = "unix_ms";
      timestamp_format = "ms";
      timestamp_timezone = timezone;

      included_keys = [ timestamp_key ] ++ context.included_keys;

      renames = {
        w = "Volume";
        y = "Value";
      };

      fields = {
        "${timestamp_key}" = "uint";
        w = "uint";
        Volume = "uint";
        y = "float";
        Value = "float";
      };
    })];
  }];

  # Originated from https://github.com/scrapehero/nasdaq_finance/blob/master/nasdaq_finance.py
  historicalHeaders = {
    Accept = "*/*";
    Accept-Encoding = "gzip, deflate, br";
    Accept-Language = "en-US,en;q=0.9";
    Host = "charting.nasdaq.com";
    Referer = "https://charting.nasdaq.com/dynamic/chart.html";
    Upgrade-Insecure-Requests = "1";
    # https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/User-Agent#chrome_ua_string
    # User-Agent = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.119 Safari/537.36";
    User-Agent = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36";
  };

  historicalFormat = { internal ? false, ... }@context: [{
    measurement_name = "security";

    tag = [{
      path = "companyName";
      rename = "companyName";
    }];

    object = [(rec {
      path = "marketData";
      timestamp_key = "Date";
      timestamp_format = "2006-01-02 15:04:05";
      timestamp_timezone = timezone;

      included_keys = [ timestamp_key ] ++ context.included_keys;
      fields = {
        "${timestamp_key}" = "string";
        High = "float";
        Low = "float";
        Open = "float";
        Close = "float";
        Value = "float";
        Volume = "uint";
      };
    })];
  }];

  httpConfiguration = { alias, collapse, urls, headers, format, internal ? false, ... }@context:
    {
      inherit alias;
      method = "GET";
      timeout = "1m";
      inherit urls;

      inherit headers;

      tags = {
        security = "stock";
        metric_source = "nasdaq";
        symbol = "@TICKER@";
        inherit collapse;
      } // (lib.optionalAttrs internal { __internal_metric_type = "test"; });

      data_format = "json_v2";
      json_v2 = format { included_keys = context.included_keys; };
    };
in
{
  agent = config.services.telegraf.extraConfig.agent;

  /*
  inputs.internal = [{
    alias = "telegraf";
    tags = { metric_source = "telegraf"; telegraf-instance = "nasdaq-historical"; };
    collect_memstats = true;
  }];
  */

  /*
  # Subject to Telegraf's batching, which adds more delay
  inputs.exec = [{
    commands = [
      "${ack}/bin/nasdaq-historical-ack @TICKER@"
    ];

    timeout = "4s";
    data_format = "influx";
  }];
  */

  inputs.http = map httpConfiguration historicalContexts;

  /*
  # Define labels that parse the timestamp for group operations
  ## Date format string, must be a representation of the Go "reference time"
  ## which is "Mon Jan 2 15:04:05 -0700 MST 2006".

  # WAY too much churn (in the millions) - relegate to query
  processors.date = [{
    tag_key = "hour";
    date_format = "15";
    timezone = timezone;
  } {
    tag_key = "day";
    date_format = "Mon";
    timezone = timezone;
  } {
    tag_key = "month";
    date_format = "Jan";
    timezone = timezone;
  } {
    tag_key = "year";
    date_format = "2006";
    timezone = timezone;
  }];
  */

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
