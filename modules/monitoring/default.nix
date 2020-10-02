{ ... }:

{
  imports =
    [
      ./grafana.nix
      ./netdata.nix
      ./prometheus.nix
      # ./zabbix.nix
    ];
}
