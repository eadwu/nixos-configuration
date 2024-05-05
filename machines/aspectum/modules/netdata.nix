{ options, config, pkgs, lib, modulesPath, ... }:

{
  # Shared kernel means this is unnecessary to duplicate
  services.netdata.enable = true;
  systemd.services.netdata.environment.DISABLE_TELEMETRY = "1";
  # cgroupv2 not supported in WSL
  # services.netdata.config."plugin:cgroups"."use unified cgroups" = "no";
  # services.netdata.config.web.mode = "none";
  services.netdata.configDir.".opt-out-from-anonymous-statistics" = pkgs.writeText ".opt-out-from-anonymous-statistics" "";
  services.netdata.configDir."exporting.conf" = pkgs.writeText "exporting.conf" ''
    [exporting:global]
    enabled = yes
    prefix = netdata
    hostname = ${config.networking.hostName}
    # data source = as collected
    # update every = 1

    [graphite:netdata]
    enabled = yes
    destination = tcp:127.0.0.1:2003

    # [opentsdb:netdata]
    # enabled = yes
    # destination = tcp:127.0.0.1:4242
  '';
}
