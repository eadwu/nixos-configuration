{ config, pkgs, lib, ... }:

with builtins; 
with lib;

let
  cfg = config.wsl;

  wslDistroDependency = distro: {
    wantedBy = [ "sysinit.target" ];

    enable = true;
    serviceConfig.Type = "oneshot";

    script = ''
      /mnt/c/Windows/system32/wsl.exe -d ${distro} --cd '~' \
        -- perl -MPOSIX -e pause
    '';
  };

  wslDistroDependencyTimer = _: 
    {
      wantedBy = [ "timers.target" ];
      description = "Keep systemd-based WSL distros active";
      timerConfig.OnUnitActiveSec = "1h";
    };

  generateWSLDependency = serviceGenerator: 
    listToAttrs (
      map (distro: { 
        name = "wsl-${distro}-dependency"; 
        value = serviceGenerator distro;
      }) (filter (distro: distro != config.networking.hostName) 
        (uniq cfg.dependencies.distro))
      );
in
{

  options.wsl.dependencies = {
    distro = mkOption {
      type = types.listOf types.str;
      default = [];
      description = "";
    };
  };

  options.wsl = {
    reclaimMemory = mkEnableOption {
      default = false;
      description = "";
    };
  };

  config = mkIf config.wsl.enable {

    systemd.services = 
      (listToAttrs (map (distro: { 
      name = "wsl-${distro}-dependency"; 
      value = wslDistroDependency distro;
    }) cfg.dependencies.distro)) // {
        reclaim-memory = {
          wantedBy = [ "default.target" ];

          enable = config.wsl.reclaimMemory;
          serviceConfig.Type = "oneshot";

          # unitConfig.StartLimitIntervalSec = "1s";
          # unitConfig.StartLimitBurst = "2";

          script = ''
            # https://devblogs.microsoft.com/commandline/memory-reclaim-in-the-windows-subsystem-for-linux-2/

            # Compact memory
            echo 1 > /proc/sys/vm/compact_memory
            # Drop page cache
            echo 1 > /proc/sys/vm/drop_caches
          '';
        };

        "wsl-udp-proxy@" = {
          path = with pkgs; [
            iproute2
            busybox
            gawk
            gnused
          ];

          serviceConfig.ExecStart = 
            let
              script = pkgs.writeShellScriptBin "sudppipe-wrapper" ''
                PORT_CONFIGURATION="$1"
                HOST_PORT="$(echo "''${PORT_CONFIGURATION}" | awk -F_ '{print $1}')"
                PROXY_PORT="$(echo "''${PORT_CONFIGURATION}" | awk -F_ '{print $2}')"

                HOST_IP="$(ip address show eth0 | grep inet | awk '{print $2}' | sed 's@/.*$@@' | head -n 1)"
                /init ${pkgs.pkgsCross.mingwW64.sudppipe}/bin/sudppipe.exe sudppipe.exe -b 127.0.0.1 "''${HOST_IP}" "''${HOST_PORT}" "''${PROXY_PORT}"
              '';
            in 
            "${script}/bin/sudppipe-wrapper %i";
        };
      };

    systemd.timers = 
      (listToAttrs (map (distro: { 
      name = "wsl-${distro}-dependency"; 
      value = wslDistroDependencyTimer distro;
    }) cfg.dependencies.distro)) // {
        reclaim-memory = {
          enable = config.wsl.reclaimMemory;

          wantedBy = [ "timers.target" ];
          description = "Zap page cache to reclaim memory from Linux to Windows Host";
          timerConfig.OnUnitActiveSec = "1m";
          # timerConfig.AccuracySec = "1us";
        };
      };

  };

}
