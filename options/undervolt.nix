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

    coreOffset = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = ''
        The amount of mV to offset the CPU cores by
      '';
    };

    gpuOffset = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = ''
        The amount of mV to offset the GPU by
      '';
    };

    uncoreOffset = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = ''
        The amount of mV to offset uncore (system-agent) by
      '';
    };

    analogioOffset = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = ''
        The amount of mV to offset analogio by
      '';
    };

    temp = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = ''
        The temperature target
      '';
    };

    tempAc = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = ''
        The temperature target on AC power
      '';
    };

    tempBat = mkOption {
      type = types.nullOr types.str;
      default = null;
      description = ''
        The temperature target on battery power
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
      after = [
        "suspend.target"
        "hibernate.target"
        "hybrid-sleep.target"
      ];
      description = "Intel Undervolt";
      serviceConfig = {
        ExecStart = ''
          ${pkgs.undervolt}/bin/undervolt \
            ${optionalString (cfg.coreOffset != null) "--core ${cfg.coreOffset}"} \
            ${optionalString (cfg.coreOffset != null) "--cache ${cfg.coreOffset}"} \
            ${optionalString (cfg.gpuOffset != null) "--gpu ${cfg.gpuOffset}"} \
            ${optionalString (cfg.uncoreOffset != null) "--uncore ${cfg.uncoreOffset}"} \
            ${optionalString (cfg.analogioOffset != null) "--analogio ${cfg.analogioOffset}"} \
            ${optionalString (cfg.temp != null) "--temp ${cfg.temp}"} \
            ${optionalString (cfg.tempAc != null) "--temp-ac ${cfg.tempAc}"} \
            ${optionalString (cfg.tempBat != null) "--temp-bat ${cfg.tempBat}"}
        '';
      };
      wantedBy = [
        "suspend.target"
        "hibernate.target"
        "hybrid-sleep.target"
        "multi-user.target"
      ];
    };
  };
}
