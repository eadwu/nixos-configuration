{ options, config, pkgs, lib, modulesPath, ... }:

{
  systemd.services.apache-kafka.serviceConfig.RuntimeDirectory = "apache-kafka";

  services.apache-kafka.enable = true;
  # services.apache-kafka.hostname = "127.0.0.1";
  # services.apache-kafka.port = 9092;
  services.apache-kafka.settings."listeners" = ["PLAINTEXT://127.0.0.1:9092"];
  services.apache-kafka.settings."log.dirs" = ["/tmp/apache-kafka"];
  services.apache-kafka.configFiles.serverProperties = lib.mkForce ../server.properties;
  /*
  services.apache-kafka.serverProperties = let
    nodeId = 0;
    controllerPort = 9093;
  in with config.services.apache-kafka;
    builtins.readFile ((pkgs.formats.javaProperties {}).generate "server.properties" {
      "process.roles" = "broker,controller";
      "node.id" = nodeId;
      "controller.quorum.voters" = "${toString nodeId}@${hostname}:${toString controllerPort}";

      listeners = "PLAINTEXT://${hostname}:${toString port},CONTROLLER://${hostname}:${toString controllerPort}";
      "inter.broker.listener.name" = "PLAINTEXT";
      "advertised.listeners" = "PLAINTEXT://${hostname}:${toString port}";
      controller.listener.names = "CONTROLLER";
      "listener.security.protocol.map" = "CONTROLLER:PLAINTEXT,PLAINTEXT:PLAINTEXT,SSL:SSL,SASL_PLAINTEXT:SASL_PLAINTEXT,SASL_SSL:SASL_SSL";

      "num.network.threads" = 3;
      "num.io.threads" = 8;
      "socket.send.buffer.bytes" = 102400;
      "socket.receive.buffer.bytes" = 102400;
      "socket.request.max.bytes" = 104857600;

      "log.dirs" = "/run/apache-kafka/kraft-combined-logs";
      "num.partitions" = 1;
      "num.recovery.threads.per.data.dir" = 1;
      "offsets.topic.replication.factor" = 1;
      "transaction.state.log.replication.factor" = 1;
      "transaction.state.log.min.isr" = 1;

      "log.retention.hours" = 48;
      "log.retention.bytes" = 1073741824;
      "log.segment.bytes" = 1073741824;
      "log.retention.check.interval.ms" = 300000;
      "default.replication.factor" = 1;
    });
  */
}
