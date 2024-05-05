{ options, config, pkgs, lib, modulesPath, ... }:

{
  # Switch to Telegraf WMI counter which can extract Perflib stuff as well
  # WSL is bad at killing Windows processes spsawned so not worth the hassle
  systemd.services.prometheus-windows_exporter = let
    yamlGenerator = pkgs.formats.yaml {};
    exporterConf = yamlGenerator.generate "config.yml" {
      telemetry.addr = "127.0.0.1:9182";
      telemetry.path = "/metrics";
      # telemetry.max-requests = 8;

      # https://www.ibm.com/docs/en/capmp/8.1.4?topic=cmhvm-adding-non-administrator-user-in-hyper-v-administrator-users-group
      collectors.enabled = lib.concatStringsSep "," [
        # "[defaults]"
        # "cache" "cpu" "cs" 
        # "hyperv" 
        # "memory" "net" "os" # "process" 
        # "remote_fx" # "service" 
        # "system" "thermalzone"

        "cpu" "memory" "net" "os"
      ];
    };
  in {
    description = "A Prometheus exporter for Windows machines";
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.pkgsCross.mingwW64.windows_exporter}/bin/windows_exporter.exe --config.file ${exporterConf}";
      ExecReload = "${pkgs.coreutils}/bin/kill -HUP $MAINPID";
      RuntimeDirectory = "wmiexporter";
      DynamicUser = true;
      # User = "windows_exporter";
      # Group = "windows_exporter";
      Restart = "on-failure";
    };
  };
}