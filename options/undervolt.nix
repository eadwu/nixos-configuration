{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.services.undervolt;

  toArgs = attrs: concatStringsSep " " (
    mapAttrsToList
      (
        arg: v: let
          value =
            if null == v then ""
            else if isInt v then toString v
            else if isString v then ''"${escape [ ''"'' ] v}"''
            else abort "undervolt.toArgs: unexpected type (v = ${v})";
        in
          "--${arg} ${value}"
      )
      attrs
  );

  undervoltCmd = "${pkgs.undervolt}/bin/undervolt ${toArgs cfg.options}";
in
{
  options.services.undervolt = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Whether to enable undervolt for Intel CPUs
      '';
    };

    options = mkOption {
      type = with types; attrsOf (nullOr (either int str));
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

    systemd.services.undervolt = {
      after = [ "suspend.target" "hibernate.target" "hybrid-sleep.target" ];
      wantedBy = [ "suspend.target" "hibernate.target" "hybrid-sleep.target" "multi-user.target" ];

      description = "Intel Undervolt";
      serviceConfig.ExecStart = undervoltCmd;
    };

    services.udev.extraRules = ''
      # Apply an undervolt for Intel CPUs
      ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="0", RUN+="${undervoltCmd}"
      ACTION=="change", SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ATTR{online}=="1", RUN+="${undervoltCmd}"
    '';
  };
}
