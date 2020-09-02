{ config, ... }:

{
  services.grafana.provision.enable = true;
  services.grafana.provision.dashboards = [
    ({
      name = "General";
      type = "file";
      disableDeletion = true;
      options.path = ./dashboards;
    })
  ];

  services.grafana = {
    enable = true;

    database.type = "postgres";
    database.host = "/run/postgresql";
    database.user = "grafana";

    smtp.enable = false;
    users.allowSignUp = false;
    users.allowOrgCreate = false;
    auth.anonymous.enable = false;
    analytics.reporting.enable = false;
  };

  systemd.services.grafana.after = [ "postgresql.service" ];
  services.postgresql = {
    enable = true;
    ensureDatabases = [ config.services.grafana.database.name ];
    ensureUsers = [
      { name = config.services.grafana.database.user;
        ensurePermissions = { "DATABASE ${config.services.grafana.database.name}" = "ALL PRIVILEGES"; };
      }
    ];
  };
}
