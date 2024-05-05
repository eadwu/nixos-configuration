config:

{
  agent = config.services.telegraf.extraConfig.agent;

  inputs.internal = [{
    alias = "telegraf";
    tags = { metric_source = "telegraf"; telegraf-instance = "windows"; };
    collect_memstats = true;
  }];

  # inputs.prometheus = [{
  #   alias = "windows_exporter_bridge";
  #   tagexclude = [ "url" ];
  #   interval = "60s"; # Once per minute
  #   tags = { metric_source = "windows_exporter"; };
  #   urls = ["http://localhost:9182/metrics"];
  #   metric_version = 1;
  # }];

  inputs.nvidia_smi = [{
    alias = "nvidia";
    tags = { metric_source = "nvidia_win"; };
    # bin_path = "/mnt/c/Windows/System32/nvidia-smi.exe";
    bin_path = "C:\\Windows\\System32\\nvidia-smi.exe";
  }];

  inputs.win_perf_counters = [{
    alias = "windows_bridge";
    tags = { metric_source = "windows"; };

    # Can use Perflib-based names from https://github.com/prometheus-community/windows_exporter
    object = [
      # Processor usage, alternative to native, reports on a per core.
      {
        ObjectName = "Processor Information";
        Instances = ["*"];
        Counters = [
          "% C1 Time"
          "% C2 Time"
          "% C3 Time"
          "C1 Transitions/sec"
          "C2 Transitions/sec"
          "C3 Transitions/sec"
          "Clock Interrupts/sec"
          "DPCs Queued/sec"
          "% DPC Time"
          "Idle Break Events/sec"
          "% Idle Time"
          "Interrupts/sec"
          "% Interrupt Time"
          "Parking Status"
          "% Performance Limit"
          "% Priority Time"
          "% Privileged Time"
          "% Privileged Utility"
          "Processor Frequency"
          "% Processor Performance"
          "% Processor Performance,secondvalue"
          "% Processor Time"
          "% Processor Utility"
          "% Processor Utility,secondvalue"
          "% User Time"
        ];
        Measurement = "win_cpu";
      }

      # Disk times and queues
      {
        ObjectName = "LogicalDisk";
        Instances = ["C:"];
        Counters = [
          "% Idle Time"
          "% Disk Time"
          "% Disk Read Time"
          "% Disk Write Time"
          "% User Time"
          "% Free Space"
          "Current Disk Queue Length"
          "Free Megabytes"
          "Disk Read Bytes/sec"
          "Disk Write Bytes/sec"
        ];
        Measurement = "win_disk";
      }

      # {
      #   ObjectName = "PhysicalDisk";
      #   Instances = ["*"];
      #   Counters = [
      #     "Disk Read Bytes/sec"
      #     "Disk Write Bytes/sec"
      #     "Current Disk Queue Length"
      #     "Disk Reads/sec"
      #     "Disk Writes/sec"
      #     "% Disk Time"
      #     "% Disk Read Time"
      #     "% Disk Write Time"
      #   ];
      #   Measurement = "win_diskio";
      # }

      {
        ObjectName = "Network Interface";
        Counters = [
          "Bytes Received/sec"
          "Bytes Sent/sec"
          "Bytes Total/sec"
          "Packets Outbound Discarded"
          "Packets Outbound Errors"
          "Packets/sec"
          "Packets Received Discarded"
          "Packets Received Errors"
          "Packets Received/sec"
          "Packets Received Unknown"
          "Packets Sent/sec"
          "Current Bandwidth"
        ];
        Instances = ["*"];
        Measurement = "win_net";
      }

      {
        ObjectName = "System";
        Counters = [
          "Context Switches/sec"
          "System Calls/sec"
          "Processor Queue Length"
          "System Up Time"

          "Threads"
          "Processes"
        ];
        Instances = ["------"];
        Measurement = "win_system";
      }

      {
        ObjectName = "Memory";
        Counters = [
          "Available Bytes"
          "Available KBytes"
          "Available MBytes"
          "Cache Bytes"
          "Cache Bytes Peak"
          "Cache Faults/sec"
          "Commit Limit"
          "Committed Bytes"
          "Demand Zero Faults/sec"
          "Free & Zero Page List Bytes"
          "Free System Page Table Entries"
          "Modified Page List Bytes"
          "Page Faults/sec"
          "Page Reads/sec"
          "Pages Input/sec"
          "Pages Output/sec"
          "Pages/sec"
          "Page Writes/sec"
          "Pool Nonpaged Allocs"
          "Pool Nonpaged Bytes"
          "Pool Paged Allocs"
          "Pool Paged Bytes"
          "Pool Paged Resident Bytes"
          "Standby Cache Core Bytes"
          "Standby Cache Normal Priority Bytes"
          "Standby Cache Reserve Bytes"
          "System Cache Resident Bytes"
          "System Code Resident Bytes"
          "System Code Total Bytes"
          "System Driver Resident Bytes"
          "System Driver Total Bytes"
          "Transition Faults/sec"
          "Transition Pages RePurposed/sec"
          "Write Copies/sec"
        ];
        Instances = ["------"];
        Measurement = "win_mem";
      }

      {
        ObjectName = "Paging File";
        Counters = [
          "% Usage"
        ];
        Instances = ["_Total"];
        Measurement = "win_swap";
      }

      {
        ObjectName = "Process";
        Counters = [
          "% Processor Time"
          "Handle Count"
          "Private Bytes"
          "Thread Count"
          "Virtual Bytes"
          "Working Set"
        ];
        # Instances = ["w3wp"];
        Instances = ["*"]; # TODO: Check if this works - telegraf has only w3wp
        Measurement = "win_proc";
      }
    ];
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
