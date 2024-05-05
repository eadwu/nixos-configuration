{ options, config, pkgs, lib, modulesPath, ... }:

let
  tomlGenerator = pkgs.formats.toml {};
  telegrafConf = tomlGenerator.generate "config.toml" ;

  telegrafMatrix = [
    {
      tag = "linux";
      executable = "${pkgs.telegraf}/bin/telegraf";
      config = telegrafConf (import ./config/linux.nix config);
    }
    # {
    #   tag = "windows";
    #   executable = "/init ${pkgs.pkgsCross.mingwW64.telegraf}/bin/telegraf.exe telegraf.exe";
    #   config = telegrafConf (import ./config/windows.nix config);
    # }
  ];

  # https://github.com/NixOS/nixpkgs/blob/ef176dcf7e76c3639571d7c6051246c8fbadf12a/nixos/modules/services/monitoring/telegraf.nix
  telegrafService = { tag, executable, config }:
    {
      name = "telegraf-${tag}";
      value = {
        description = "Telegraf Agent (${tag})";

        wants = [ "apache-kafka.service" "chronyd.service" ];
        after = [ "apache-kafka.service" "chronyd.service" ] ;
        wantedBy = [ "default.target" ];
        path = with pkgs; [ chrony ];

        serviceConfig = {
          ExecStart = "${executable} -config ${config}";
          ExecReload = "${pkgs.coreutils}/bin/kill -HUP $MAINPID";
          # RuntimeDirectory = "telegraf-windows";
          # DynamicUser = true;
          # User = "telegraf";
          # Group = "telegraf";
          Restart = "on-failure";
          RestartSec = "2s";
          # for ping probes
          # AmbientCapabilities = [ "CAP_NET_RAW" ];
        };
      };
    };
in
{
  imports = [ 
    ./alphavantage.nix
    ./nasdaq.nix
  ];

  nixpkgs.overlays = [ (final: prev: { 
    telegraf = prev.telegraf.overrideAttrs (oldAttrs: {
      patches = (oldAttrs.patches or []) ++ [ ./telegraf.patch ];
    }); 
  }) ];

  # Only the telegraf saving to db needs to be a system account
  # WSL user systemd is unstable so keep as system for now
  services.telegraf.enable = true;
  services.telegraf.extraConfig = import ./config/bridge.nix config;
  systemd.services = {
    telegraf.after = [ "apache-kafka.service" ];
    telegraf.wants = [ "apache-kafka.service" ];
    telegraf.serviceConfig.RestartSec = "2s";
  } // (lib.listToAttrs (map telegrafService telegrafMatrix));
}
