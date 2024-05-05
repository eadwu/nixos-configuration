{ lib, options, config, pkgs, modulesPath, ... }:

{
  services.dbus.implementation = "broker";

  /*
  fileSystems."${config.networking.hostName}" = {
    device = "/";
    mountPoint = "/mnt/wslg/${config.networking.hostName}";
    fsType = "none";
    options = [ "bind" ];
    depends = [ "/" "/mnt/wslg" ];
  };
  */

  environment.systemPackages = with pkgs; [ htop iotop ripgrep wget wget2 vim ];

  # No modules in kernel build
  boot.kernelModules = lib.mkOverride (-1) [];

  networking.whitelist = [
    # Easy Anti-Cheat
    "^download.eac-cdn.com$"
    "^download-alt.easyanticheat.com$"

    # Apex Legends
    # "^.*compute.amazonaws.com$" # Amazon compute servers ... for some games

    # "^gossip.easyanticheat.net$"
    # "^gossip.eac-front.com$"
    # "^gossip-eu.eac-front.com$"
    # "^gamesec-gossip-.*.elb.amazonaws.com$"

    # "^ocsp.rootg2.amazontrust.com$"

    # "^.*.cloudfront.net$"

    # "^dev.virtualearth.net$" # Costco location provider
    # "^fp.msedge.net$" # XBox Game pass integration ...?
  ];

  boot.kernelPackages = lib.mkOverride (-1) pkgs.linuxPackages_latest;

  systemd.services."console-getty".enable = false;
  # systemd.services."console-getty".restartIfChanged = false;
  # systemd.services."console-getty".serviceConfig.Restart = lib.mkForce "on-failure";

  # work around https://github.com/microsoft/WSL/issues/8918
  # systemd.services."user-runtime-dir@".unitConfig.ConditionPathIsMountPoint = "!/run/user/%i";
  systemd.services."user@".after = [ "run-user-1000.mount" ];

  # specialisation.kresd.configuration = {
  #   system.nixos.tags = ["kresd"];
  #   imports = [ ../../machines/caelus/modules/kresd.nix ];
  # };

  nix.settings.trusted-users = [ config.wsl.defaultUser ];

  programs.ssh.extraConfig = ''
    NoHostAuthenticationForLocalhost yes
  '';

  # Don't restart ssh during system activation - so deploy-rs doesn't die mid-activation
  systemd.services.sshd.restartIfChanged = lib.mkForce false;
  systemd.services."sshd@".restartIfChanged = lib.mkForce false;

  # Enable SSH
  services.openssh.enable = true;
  services.openssh.startWhenNeeded = true;
  services.openssh.settings.permitRootLogin = "no";

  security.pam.services.sshd.allowNullPassword = true;
  services.openssh.extraConfig = lib.mkOrder (-1) ''
    UsePAM no
    PermitEmptyPasswords yes
  '';

  # No password as requested
  users.mutableUsers = false;

  # Use wayland windows natively if possible
  # environment.variables.MOZ_ENABLE_WAYLAND = "1";
  environment.variables.LD_LIBRARY_PATH = let
    ldPkgSet = with pkgs;
      [
        stdenv.cc.cc
        zlib
        # intel-gmmlib  # TODO: Breaks Intel integration for D3D12
        (runCommand "libedit2" {} ''
          mkdir -p $out/lib
          cp ${libedit}/lib/libedit.so $out/lib
          ln -s $out/lib/libedit.so $out/lib/libedit.so.2
        '')
      ];
  in lib.mkForce (lib.concatStringsSep ":" [
    "/usr/lib/wsl/lib"
    (lib.makeLibraryPath ldPkgSet)
    "/run/current-system/sw/lib"
  ]);

  # systemd.services.systemd-udevd.enable = lib.mkForce true;
  users.users.${config.wsl.defaultUser} = {
    hashedPassword = "";
    extraGroups = [
      "video"
      "render"

      "docker"
      "audio"
      "wheel"
      "plugdev"
    ];
  };

  boot.cleanTmpDir = true;
  # systemd.tmpfiles.rules = lib.mkAfter [
  #   # Don't remove the X11 socket
  #   "d /tmp/.X11-unix 1777 root root"
  # ];

  wsl = {
    enable = true;
    defaultUser = lib.mkDefault "nixos";
    startMenuLaunchers = lib.mkDefault false;

    # Enable native Docker support
    # docker-native.enable = true;

    # Enable integration with Docker Desktop (needs to be installed)
    # docker-desktop.enable = true;

    tarball.includeConfig = false;
  };

  wsl.wslConf = {
    automount.root = lib.mkForce "/mnt";
    # automount.options = options.wsl.wslConf.automount.options;
  };

  wsl.interop = {
    register = lib.mkDefault false;
    includePath = lib.mkDefault true;
  };

  wsl.wslConf.network = {
    generateHosts = false;
    generateResolvConf = false;
  };

  systemd.enableUnifiedCgroupHierarchy = false;
  # systemd.services.firewall.enable = lib.mkOverride 0 true;

  imports =
    [
      ./module.nix

      ../../modules/network
      ../../modules/zsh.nix
    ];

  # wsl.dependencies.distro = [ "caelus" ];

  services.monit.enable = true;
  services.monit.config = ''
    set daemon 10

    set httpd
        port 28${builtins.toString (lib.elemAt config.services.openssh.ports 0)}
        use address 127.0.0.1
  '';

  # systemd-networkd and systemd-resolved
  networking.useHostResolvConf = false;
  networking.wireless.iwd.enable = lib.mkOverride 0 false;

  systemd.services.systemd-resolved.enable = lib.mkOverride 0 (config.services.resolved.enable);
  services.resolved = {
    enable = lib.mkForce true;
    fallbackDns = [
      "[::1]:853" "127.0.0.1:853"
      # "[::1]:53" "127.0.0.1:53"
      "[::1]:54" "127.0.0.1:54"
    ];

    llmnr = "false";
    dnssec = "false";
    extraConfig = ''
      DNSOverTLS=opportunistic
    '';
  };

  # systemd.services.eth0-mdns = {
  #   after = [ "systemd-resolved.service" ];
  #   wantedBy = [ "systemd-resolved.service" ];

  #   enable = false;
  #   serviceConfig.Type = "oneshot";

  #   script = ''
  #     systemd-resolve --interface=eth0 --set-mdns=true
  #   '';
  # };

  # Virtual adapter anyway
  systemd.services.systemd-networkd-wait-online.serviceConfig.ExecStart = [ "" "${pkgs.coreutils}/bin/true" ];

  # No X11 forwarding over SSH
  programs.ssh.setXAuthLocation = false;
  security.pam.services.su.forwardXAuth = lib.mkForce false;

  # documentation.nixos.enable = true;
  security.audit.enable = lib.mkForce true;

  users.defaultUserShell = "${pkgs.zsh}/bin/zsh";
  programs.zsh.interactiveShellInit = ''
    # [Up-Arrow] - fuzzy find history forward
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "$terminfo[kcuu1]" up-line-or-beginning-search

    # [Down-Arrow] - fuzzy find history backward
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "$terminfo[kcud1]" down-line-or-beginning-search

    nix-index-update () {
      tag=$(git -c 'versionsort.suffix=-' ls-remote --exit-code --refs --tags --sort='v:refname' \
        https://github.com/Mic92/nix-index-database | awk 'END {match($2, /([^/]+)$/, m); print m[0]}')

      curl -L "https://github.com/Mic92/nix-index-database/releases/download/$tag/index-x86_64-linux" -o $XDG_RUNTIME_DIR/files-$tag
      mv $XDG_RUNTIME_DIR/files-$tag $HOME/.cache/nix-index/files
    }

    recreate-wslg-socket () {
      # https://github.com/microsoft/wslg/wiki/Diagnosing-%22cannot-open-display%22-type-issues-with-WSLg#x11-display-socket
      umount /tmp/.X11-unix
      rm -rf /tmp/.X11-unix

      mount -t tmpfs none /tmp/.X11-unix
      ln -s /mnt/wslg/.X11-unix /tmp/.X11-unix
    }

    docker-clean () {
      docker stop $(docker ps -aq)
      docker rm $(docker ps -aq)
      docker rmi $(docker images -q)
    }
  '';

  nix.package = pkgs.nixVersions.unstable;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  nix.settings = {
    sandbox = true;
    require-sigs = true;
  };
  /* Prevent Nix from hogging entire system. */
  systemd.services.nix-daemon.serviceConfig.Slice = "user-nixbld.slice";
  systemd.slices.user-nixbld.sliceConfig = {
    # 200 * 12 / config.nix.maxJobs / 2
    CPUWeight = toString (200 * 12 / (6 * 2));
    # config.nix.maxJobs / 12 / 2 * 1024
    CPUShares = toString (1024 * 6 / 24);
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowAliases = false;
  nixpkgs.overlays = [
    # Generic Overlays
    (import ../../overlays)
    # WSL-Specific Overlay
    (import ./overlay.nix)
  ];
}
