{ options, config, flakes, pkgs, lib, modulesPath, ... }:

{
  # services.sshd.enable = true;

  time.timeZone = "America/Los_Angeles";

  # Allow compilation of windows executables
  nixpkgs.config.allowUnsupportedSystem = true;

  # hardware.nvidia.open = true;
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
  # services.xserver.videoDrivers = [ "nvidia" ];

  networking.hosts."127.0.0.1" = [ "127.0.0.1.k3s.kube" ];

  virtualisation.docker.enable = true;
  services.k3s.enable = true;
  services.k3s.role = "server"; # or "agent"
  # services.k3s.serverAddr = ""; # join HA cluster
  services.k3s.clusterInit = true; # initialize HA cluster
  services.k3s.token = "k3s";
  # services.k3s.disableAgent = true;
  services.k3s.extraFlags = lib.concatStringsSep " " [
    "--write-kubeconfig-mode=644"
    # "--bind-address=127.0.0.1"
    # "--advertise-address=127.0.0.1"
    # "--kube-scheduler-arg \"bind-address=127.0.0.1\""
    # "--kube-scheduler-arg \"master=127.0.0.1\""
    # "--kubelet-arg \"address=127.0.0.1\""
    # "--kube-controller-manager-arg \"bind-address=127.0.0.1\""
    # "--kube-controller-manager-arg \"master=127.0.0.1\""
    # "--https-listen-port=6443"
    "--flannel-backend=wireguard-native"
    "--disable=traefik"
    # "--disable-helm-controller"
    # "--snapshotter=stargz"
  ];

  systemd.services.k3s-proxy = {
    after = [ "k3s.service" ];
    wants = [ "k3s.service" ];
    wantedBy = [ "default.target" ];

    description = "Kubernetes Proxy";

    serviceConfig.ExecStart = "${pkgs.k3s}/bin/k3s kubectl proxy --address='127.0.0.1' --api-prefix='/' --port=8001";
    # serviceConfig.Restart = "yes";
  };

  programs.zsh.shellAliases.kubectl = "k3s kubectl";
  # programs.zsh.shellAliases.helm = "helm --kubeconfig /etc/rancher/k3s/k3s.yaml";
  environment.variables.KUBECONFIG = "/etc/rancher/k3s/k3s.yaml";

  systemd.services.k3s.path = with pkgs; [ glibc nvidia-k3s ];
  # systemd.services.k3s.environment.LD_LIBRARY_PATH = "/usr/lib/wsl/lib";
  systemd.services.k3s.serviceConfig.PrivateTmp = true;
  systemd.services.k3s.preStart = ''
    echo "Initializing cache with directory /usr/lib/wsl/lib"
    ldconfig -C /tmp/ld.so.cache /usr/lib/wsl/lib

    echo "Printing ld cache contents"
    ldconfig -C /tmp/ld.so.cache --print-cache
  '';

  nixpkgs.overlays = [ (final: prev: {

    nvidia-k3s = with final.pkgs; mkNvidiaContainerPkg {
      name = "nvidia-k3s";
      containerRuntimePath = "runc";
      configTemplate = ./etc/nvidia-container-runtime/config.toml;
      extraCommands = ''
        for binary in nvidia-ctk nvidia-container-runtime nvidia-container-runtime-hook;
        do
          wrapProgram $out/bin/$binary \
            --prefix LD_LIBRARY_PATH : /usr/lib/wsl/lib
        done
        ln -sf $out/bin/nvidia-container-runtime-hook $out/bin/nvidia-container-toolkit
      '';
    };

    libnvidia-container = prev.libnvidia-container.overrideAttrs (oldAttrs: {
      version = flakes.libnvidia-container.version;
      src = flakes.libnvidia-container.path;

      patches = [
        # ./libnvidia-container.patch
        ./libnvidia-container-ldcache.patch
        (flakes.nixpkgs.path + "/pkgs/applications/virtualization/libnvidia-container/inline-c-struct.patch")
      ];

      postPatch = (oldAttrs.postPatch or "") + ''
        sed -i "s@/etc/ld.so.cache@/tmp/ld.so.cache@" src/common.h
      '';
    });

    nvidia-container-toolkit = prev.nvidia-container-toolkit.overrideAttrs (oldAttrs: {
      version = flakes.nvidia-container-toolkit.version;
      src = flakes.nvidia-container-toolkit.path;

      postPatch = (oldAttrs.postPatch or "") + ''
        sed -i "s@/etc/ld.so.cache@/tmp/ld.so.cache@" internal/ldcache/ldcache.go
        # Propagate /dev/card* and /dev/render*
        # sed -i "s@return selected, nil@return devices, nil@" internal/discover/filter.go
      '';
    });
  }) ];

  imports =
    [
      ../../configurations/wsl
      ../../configurations/wsl/wslg.nix
      # ../../configurations/wsl/zram.nix

      # ../../modules/audio/pipewire.nix
      # ../../modules/audio/pulseaudio.nix

      ../../modules/lorri.nix
      ../../modules/watchman.nix

      # ../../modules/emacs.nix
      ../../modules/nix-ld.nix

      ../../machines/caelus/config.nix
      ../../machines/aspectum/config.nix
    ];

  wsl.reclaimMemory = true;

  # disabledModules = [ "config/zram.nix" ];
  zramSwap = {
    enable = true;
    swapDevices = 1;
    memoryPercent = 60;
    memoryMax = 8589934592 / 2; # 8G
    priority = 100;
    algorithm = "zstd";
  };
  systemd.services."systemd-zram-setup@" = {
    serviceConfig.ConditionPathExists = "!/dev/%i";
    restartIfChanged = false;
  };
  systemd.services.zram0-setup = {
    wants = [ "systemd-zram-setup@zram0.service" ];
    after = [ "no-default-swap.service" "systemd-zram-setup@zram0.service" ];
    # wantedBy = [ "no-default-swap.service" ];
    serviceConfig.ExecStart = "${pkgs.util-linux}/bin/swapon /dev/zram0 --priority ${toString config.zramSwap.priority}";
    restartIfChanged = false;
  };
  systemd.services.no-default-swap = {
    # wantedBy = [ "multi-user.target" ];
    serviceConfig.ExecStart = "${pkgs.util-linux}/bin/swapoff -a";
    restartIfChanged = false;
  };

  boot.kernel.sysctl = {
    "vm.vfs_cache_pressure" = 50;
    "vm.swappiness" = lib.mkDefault 1; # 10;
    "vm.dirty_background_ratio" = lib.mkDefault 1; # increase slowly, up to 10%, if CPU gets too busy with compression
    "vm.dirty_ratio" = lib.mkDefault 4; # https://wiki.archlinux.org/index.php/Sysctl#Virtual_memory
    "kernel.kexec_load_disabled" = 1;
    "kernel.unprivileged_userns_clone" = true;
  };

  /*
  wsl.dependencies.distro = [
    # "abyssus" "architect" "aspectum" "caelus" "concentus" "cratis"
    "architect" "aspectum"
  ];
  */

  services.openssh.ports = [ 22 ];

  /*
  # Depends on pipewire >= 0.3.57 for tunneling fix
  environment.variables.PULSE_SERVER = "/mnt/wslg/PulseServer";
  # environment.variables.PULSE_SERVER = "/tmp/pipewire";
  systemd.user.services.pipewire.wantedBy = lib.optionals config.services.pipewire.enable [ "default.target" ];
  systemd.user.services.pipewire-pulse.wantedBy = lib.optionals config.services.pipewire.enable [ "default.target" ];
  systemd.user.services.wireplumber.wantedBy = lib.optionals config.services.pipewire.enable [ "default.target" ];
  services.pipewire.config.pipewire = let
    default-pipewire-conf = lib.importJSON "${modulesPath}/services/desktops/pipewire/daemon/pipewire.conf.json";
  in
  {
    "context.properties" = default-pipewire-conf."context.properties" // {
      "link.max-buffers" = 64;

      # "default.clock.rate" = 48000;
      # "default.clock.allowed-rates" = "[ 48000 96000 ]";

      # "default.clock.min-quantum" = 16;
      # "default.clock.max-quantum" = 16384;
      # "default.clock.quantum-limit" = 32768;

      # "api.alsa.period-size" = 512;
      # "api.alsa.headroom" = 8192;
    };

    # "context.objects" = default-pipewire-conf."context.objects" ++ [
    #   {
    #     factory = "adapter";
    #     args = {
    #       "factory.name" = "support.null-audio-sink";
    #       "node.name" = "wsl";
    #       "media.class" = "Audio/Sink";
    #       "audio.position" = "[ FL FR FC LFE RL RR ]";
    #       "adapter.auto-port-config" = {
    #         mode = "dsp";
    #         monitor = "true";
    #         position = "preserve";
    #       };
    #     };
    #   }
    # ];

    "context.modules" = default-pipewire-conf."context.modules" ++ [
      {
        name = "libpipewire-module-pulse-tunnel";
        args = {
          "tunnel.mode" = "sink";
          "pulse.server.address" = "unix:/mnt/wslg/PulseServer";
          # "pulse.latency" = "0ms";
          "stream.props" = {};
        };
      }

      {
        name = "libpipewire-module-pipe-tunnel";
        args = {
          "tunnel.mode" = "sink";
          "pipe.filename" = "/mnt/c/wsl/interop/pipewire";
          # "audio.format" = "s16le";
          # "audio.format" = "float32le";
          "audio.rate" = 44100;
          "audio.channels" = 2;

          # "sink.name" = "wsl";
          # sink_properties=device.description=Redirected WSL audio

          # "stream.props" = {};
        };
      }

      # {
      #   name = "libpipewire-module-rtp-sink";
      #   args = {
      #     "sap.ip" = "224.2.127.254";
      #     "sap.port" = 9875;
      #     "destination.ip" = "224.0.0.55";
      #     # "destination.ip" = "192.168.1.158";
      #     "destination.port" = 18182;
      #     # "net.mtu" = 1500;
      #     # "net.ttl" = 1;
      #     # "net.loop" = false;

      #     "sess.name" = config.wsl.defaultUser;

      #     # "audio.format" = "S16BE";
      #     # "audio.rate" = 48000;
      #     # "audio.channels" = 2;
      #   };
      # }

      # {
      #   name = "libpipewire-module-rtp-source";
      #   args = {
      #     "sap.ip" = "224.2.127.254";
      #     "sap.port" = 9875;
      #     "sess.latency.msec" = 200;
      #   };
      # }
    ];
  };

  services.pipewire.config.pipewire-pulse = let
    default-pipewire-pulse-conf = lib.importJSON "${modulesPath}/services/desktops/pipewire/daemon/pipewire-pulse.conf.json";
  in
  lib.recursiveUpdate default-pipewire-pulse-conf {
    "pulse.properties"."server.address" = [ "unix:/tmp/pipewire" "unix:/mnt/c/wsl/interop/PipewireServer" ];

    "context.exec" = default-pipewire-pulse-conf."context.exec" ++ [
      # {
      #   path = "/mnt/c/wsl/ffmpeg/bin/ffplay.exe";
      #   args = "-fflags nobuffer -fflags discardcorrupt -flags low_delay -framedrop -probesize 32 -analyzeduration 0 -sync ext -nodisp -ar 48000 -ac 2 -i 'sap://224.0.0.56:9875'";
      # }

      # {
      #   path = "pactl";
      #   args = "load-module module-rtp-send source=wsl.monitor channels=2 rate=48000 destination_ip=224.0.0.55 port=18182 inhibit_auto_suspend=never stream_name=wslrtp enable_opus=true loop=false mtu=1500 format=aLaw";
      # }
    ];
  };
  */

  wsl.defaultUser = "architect";
  networking.hostName = config.wsl.defaultUser;

  # environment.variables.D3D12_DEBUG = "all";
  # environment.variables.D3D12_DEBUG = "experimental";
  # environment.variables.MESA_D3D12_DEFAULT_ADAPTER_NAME = "INTEL";
  environment.variables.MESA_D3D12_DEFAULT_ADAPTER_NAME = "NVIDIA";

  environment.pathsToLink = [ "share/hunspell" "share/myspell/dicts" ];
  environment.variables.DONT_PROMPT_WSL_INSTALL = "1";
  environment.systemPackages = with pkgs; [
    androidStudioPackages.stable
    androidStudioPackages.beta
    androidStudioPackages.canary
    androidStudioPackages.dev

    mono
    dotnetCorePackages.sdk_6_0
    # (with dotnetCorePackages; combinePackages [
    #   # The dotnetCorePackages.sdk contains both a runtime and the full sdk of a given version.
    #   # The runtime and aspnetcore packages are meant to serve as minimal runtimes to deploy alongside already built applications.
    #   # sdk_7_0 sdk_6_0 sdk_5_0 sdk_3_1
    #   # EOL
    #   # sdk_3_0 sdk_2_2 sdk_2_1
    # ])

    poetry

    deploy-rs.deploy-rs
    kubernetes-helm
    helmsman
    terraform
    nvidia-k3s

    bcachefs-tools

    gitFull
    hub
    git-filter-repo
    git-lfs

    hunspell
    hunspellDicts.en_US
    hunspellDicts.en_US-large

    ark
    chromium
    evince
    gimp
    lapce
    thunderbird
    vscode-insiders-with-extensions
    vivaldi-snapshot
    discord-canary
    element-desktop
    libreoffice-fresh
    st

    gnupg
    pass

    nix-index
    nix-diff

    # woeusb-ng

    file
    tree
    rclone
    pciutils
    mesa-demos

    imagemagick
    poppler_utils

    docker
    docker-compose

    go

    gcc

    xfce.thunar
    xfce.thunar-volman

    zip
    unzip

    busybox
    texlive.combined.scheme-full

    ffmpeg

    nil
    rnix-lsp
  ];

  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "curses"; # ... "qt";
  };
}
