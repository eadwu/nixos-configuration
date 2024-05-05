{ flakes, options, config, pkgs, lib, modulesPath, ... }:

with lib;
{
  # https://github.com/hercules-ci/arion/blob/main/src/nix/modules/nixos/container-systemd.nix

  boot.isContainer = true;
  boot.specialFileSystems = lib.mkForce {};
  networking.hostName = "";

  services.journald.console = "/dev/console";

  systemd.services.systemd-logind.enable = false;
  systemd.services.console-getty.enable = false;

  systemd.sockets.nix-daemon.enable = lib.mkDefault false;
  systemd.services.nix-daemon.enable = lib.mkDefault false;

  # ...
  environment.noXlibs = mkDefault true;

  documentation.enable = mkDefault false;

  documentation.doc.enable = mkDefault false;

  documentation.info.enable = mkDefault false;

  documentation.man.enable = mkDefault false;

  documentation.nixos.enable = mkDefault false;

  programs.command-not-found.enable = mkDefault false;

  services.logrotate.enable = mkDefault false;

  services.udisks2.enable = mkDefault false;

  xdg.autostart.enable = mkDefault false;
  xdg.icons.enable = mkDefault false;
  xdg.mime.enable = mkDefault false;
  xdg.sounds.enable = mkDefault false;

  # ...
/*
    nixos.configuration.imports = [
      ../nixos/container-systemd.nix
      ../nixos/default-shell.nix
      (pkgs.path + "/nixos/modules/profiles/minimal.nix")
    ];
    image.command = [ "/usr/sbin/init" ];
    image.contents = [
      (pkgs.runCommand "root-init" {} ''
        mkdir -p $out/usr/sbin
        ln -s ${config.nixos.build.toplevel}/init $out/usr/sbin/init
      '')
    ];
    service.environment.container = "docker";
    service.environment.PATH = "/usr/bin:/run/current-system/sw/bin/";
    service.volumes = [
      "/sys/fs/cgroup:/sys/fs/cgroup:ro"
    ];
    service.tmpfs = [
      "/run"          # noexec is fine because exes should be symlinked from elsewhere anyway
      "/run/wrappers" # noexec breaks this intentionally
    ] ++ lib.optional (config.nixos.evaluatedConfig.boot.tmpOnTmpfs) "/tmp:exec,mode=777";

    service.stop_signal = "SIGRTMIN+3";
    service.tty = true;
    service.defaultExec = [config.nixos.build.x-arion-defaultShell "-l"];
*/
  # ...

  time.timeZone = "America/Los_Angeles";

  services.kresd.instances = 1;
  services.kresd.listenPlain = lib.mkForce [ "0.0.0.0:53" ];
}
