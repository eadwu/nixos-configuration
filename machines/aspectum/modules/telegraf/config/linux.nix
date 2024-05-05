config:

rec {
  agent = config.services.telegraf.extraConfig.agent;

  inputs.internal = [{
    alias = "telegraf";
    tags = { metric_source = "telegraf"; telegraf-instance = "linux"; };
    collect_memstats = true;
  }];

  inputs.chrony = [{
    alias = "chronyc";
    tags = { metric_source = "chrony"; };
    # Configured servers are hostnames
    dns_lookup = true;
  }];

  /*
  # TODO: Figure out security implications of ping
  inputs.ping = [{
    method = "native";
    count = 1;
    urls = [
      "23m.com" # Germany
      "aarnet.edu.au" # Australia
      "acc.umu.se" # Sweden
      "adfinis.com" # Switzerland
      "archimonde.ts.si" # Slovenia
      "atviras.lt" # Lithuania
      "constant.com" # United States
      "csclub.uwaterloo.ca" # Canada
      "digitalpacific.com.au" # Australia
      "dotsrc.org" # Denmark
      "f4st.host" # Germany
      "fsmg.org.nz" # New
      "funami.tech" # South
      "guillaumea.fr" # Singapore
      "hackingand.coffee" # United States
      "ip-connect.vn.ua" # Ukraine
      "kernel.org" # United States
      "liquidtelecom.com" # Kenya
      "lug.mtu.edu" # United States
      "mirror.surf" # Russia
      "neuf.no" # Norway
      "neusoft.edu.cn" # China
      "ocf.berkeley.edu" # United States
      "one.com" # Denmark
      "pidginhost.com" # Romania
      "pseudoform.org" # Germany
      "rit.edu" # United States
      "rnl.tecnico.ulisboa.pt" # Portugal
      "rwth-aachen.de" # Germany
      "selfnet.de" # Germany
      "sh.cvut.cz" # Czechia
      "theo546.fr" # France
      "tuna.tsinghua.edu.cn" # China
      "ustc.edu.cn" # China
      "xtom.com.hk" # Hong
      "xtom.de" # Germany
      "xtom.ee" # Estonia
    ];
  }];
  */

  /*
  # Source of high cardinality
  inputs.systemd_units = [{
    alias = "systemd";
    tags = { metric_source = "systemd"; };
    timeout = "4s";
    unittype = "service";
  }];
  */

  # inputs.nvidia_smi = [{
  #   alias = "nvidia";
  #   tags = { metric_source = "nvidia_linux"; };
  #   # bin_path = "/usr/lib/wsl/lib/nvidia-smi";
  # }];

  inputs.socket_listener = [{
      alias = "graphite_bridge";
      data_format = "graphite";
      service_address = "tcp://127.0.0.1:2003";
      separator = ".";
      templates = [
        # Knot Resolver
        "kresd.* metric_source.host.instance.measurement*"
        # Netdata
        "netdata.* metric_source.host.measurement*"
        "netdata.*.disk_util.* metric_source.host.measurement.disk.measurement*"
        # OhmGraphite
        "ohm.* metric_source.host.measurement*"
        # Default
        "metric_source.measurement*"
      ];
  }];

  /*
  inputs.prometheus = [{
    alias = "mimir_internal";
    urls = [ "http://localhost:9009/metrics" ];
    metric_version = 2;
    tags = { metric_source = "mimir"; };
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
