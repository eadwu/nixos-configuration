{ options, config, pkgs, lib, modulesPath, ... }:

{
  systemd.services.grafana.after = [ "postgresql.service" ];
  services.grafana = {
    enable = true;
    dataDir = "/run/grafana";

    settings.database.type = "postgres";
    settings.database.host = "/run/postgresql";
    settings.database.user = "grafana";

    settings.smtp.enable = false;
    settings.users.allow_sign_up = false;
    settings.users.allow_org_create = false;
    settings."auth.anonymous".enable = false;
    settings.analytics.reporting_enabled = false;
  };

  services.postgresql = {
    enable = true;
    ensureDatabases = [ config.services.grafana.settings.database.name ];
    ensureUsers = [
      { name = config.services.grafana.settings.database.user;
        # https://github.com/NixOS/nixpkgs/pull/266270/files
        ensureDBOwnership = true;
      }
    ];
  };
}
