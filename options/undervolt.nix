{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.services.undervolt;
in {
  options.services.undervolt = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Whether to enable undervolt for Intel CPUs
      '';
    };

    options = mkOption {
      type = types.attrs;
      default = {};
      description = ''
        Command line argument(s) to pass to <command>undervolt</command>
      '';
    };
  };

  config = mkIf cfg.enable {
    boot.kernelModules = [
      "msr"
    ];

    environment.systemPackages = with pkgs; [
      undervolt
    ];

    services.udev.extraRules = mkIf (builtins.hasAttr "temp-bat" cfg.options) ''
      ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", RUN+="${pkgs.systemd}/bin/systemctl restart undervolt"
    '';

    systemd.services.undervolt = {
      after = [ "suspend.target" "hibernate.target" "hybrid-sleep.target" ];
      wantedBy = [ "suspend.target" "hibernate.target" "hybrid-sleep.target" "multi-user.target" ];

      description = "Intel Undervolt";
      serviceConfig.ExecStart = ''
        ${pkgs.undervolt}/bin/undervolt ${concatStringsSep " " (mapAttrsToList
          (arg: value: "--${arg} ${toString value}")
          cfg.options)}
      '';
    };
  };
}
