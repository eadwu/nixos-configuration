{ config, ... }:

let
  hostName = config.networking.hostName;
in
{
  services.zabbixWeb = {
    enable = true;

    database.type = "pgsql";
    database.host = "/run/postgresql";
    virtualHost.hostName = "${hostName}.localhost.org";
    virtualHost.adminAddr = "${hostName}@localhost.org";
  };

  services.zabbixServer = {
    enable = true;
    openFirewall = false;

    database.type = "pgsql";
    database.createLocally = true;
  };

  services.zabbixAgent = {
    enable = true;
    server = "localhost";
    openFirewall = false;
  };
}
