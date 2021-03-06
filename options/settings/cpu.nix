{ config, lib, ... }:

with lib;

let
  cfg = config.nixos.settings.machine.cpu;
in
{
  options.nixos.settings.machine.cpu = {

    tdp = {
      nominal = mkOption {
        type = types.int;
        default = 0;
      };

      up = mkOption {
        type = types.int;
        default = 0;
      };
    };

    undervolt = {
      core = mkOption {
        type = types.int;
        default = 0;
      };

      gpu = mkOption {
        type = types.int;
        default = 0;
      };

      cache = mkOption {
        internal = true;
        type = types.int;
        default = 0;
      };

      uncore = mkOption {
        type = types.int;
        default = 0;
      };

      analogio = mkOption {
        type = types.int;
        default = 0;
      };
    };

  };

  config = {
    nixos.settings.machine.cpu.undervolt.cache = cfg.undervolt.core;

    # Compatibility with intel-undervolt
    services.undervolt = with cfg.undervolt; {
      coreOffset = core;
      gpuOffset = gpu;
      uncoreOffset = uncore;
      analogioOffset = analogio;
    };

    # Compatibility with throttled
    services.throttled.extraConfig =
      let
        mkValueString = v:
          if builtins.isFloat v then toString v
          else if true     == v then "True"
          else if false    == v then "False"
          else generators.mkValueStringDefault {} v;
        mkKeyValue = generators.mkKeyValueDefault { inherit mkValueString; } ":";
        toConf = generators.toINI { inherit mkKeyValue; };

        settings = {
          GENERAL = {
            Enabled = true;
            Sysfs_Power_Path = "/sys/class/power_supply/AC*/online";
          };

          BATTERY = {
            Update_Rate_s = 30;
            PL1_Tdp_W = cfg.tdp.nominal - 5;
            PL1_Duration_s = 30;
            PL2_Tdp_W = cfg.tdp.nominal + 5;
            PL2_Duration_S = 0.005;
            Trip_Temp_C = 80;
            cTDP = 0;
            Disable_BDPROCHOT = false;
          };

          AC = {
            Update_Rate_s = 5;
            PL1_Tdp_W = cfg.tdp.up - 5;
            PL1_Duration_s = 45;
            PL2_Tdp_W = cfg.tdp.up + 5;
            PL2_Duration_S = 0.007;
            Trip_Temp_C = 95;
            HWP_Mode = true;
            cTDP = 0;
            Disable_BDPROCHOT = false;
          };

          # In theory, the undervolting can be more aggressive since the cpu isn't as stressed
          "UNDERVOLT.BATTERY" = settings."UNDERVOLT.AC";

          "UNDERVOLT.AC" = with cfg.undervolt; {
            CORE = core;
            GPU = gpu;
            CACHE = cache;
            UNCORE = uncore;
            ANALOGIO = analogio;
          };
        };
      in toConf settings;
  };
}
