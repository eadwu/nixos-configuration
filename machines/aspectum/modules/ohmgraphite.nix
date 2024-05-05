{ options, config, pkgs, lib, modulesPath, ... }:

{
  # Requires local system permissions to get any information not already fetched
  systemd.services.ohmgraphite = let
    ohmgraphite-config = pkgs.writeText "OhmGraphite.exe.config" ''
      <?xml version="1.0" encoding="utf-8" ?>
      <configuration>
        <appSettings>
          <add key="host" value="127.0.0.1" />
          <add key="port" value="2003" />
          <add key="interval" value="4" />
          <add key="tags" value="false" />
        </appSettings>
      </configuration>
    '';
  in {
    description = "OhmGraphite";
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.ohmgraphite}/bin/OhmGraphite.exe run -config ${ohmgraphite-config}";
      ExecReload = "${pkgs.coreutils}/bin/kill -HUP $MAINPID";
      RuntimeDirectory = "ohmgraphite";
      DynamicUser = true;
      Restart = "on-failure";
    };
  };
}