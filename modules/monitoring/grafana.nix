{ config, ... }:

{
  services.grafana.provision.enable = true;
  services.grafana.provision.dashboards = [
    ({
      name = "General";
      type = "file";
      disableDeletion = true;
      options.path = ./dashboards/general;
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
        # https://github.com/NixOS/nixpkgs/pull/266270/files
        ensureDBOwnership = true;
      }
    ];
  };
}
