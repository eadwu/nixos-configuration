{ modulesPath, flakes, options, config, pkgs, lib, ... }:

let
  user = "framework";
in
{
  imports = [
    flakes.impermanence.nixosModules.impermanence
    flakes.home-manager.nixosModules.home-manager

    ./nixos-generate-config/hardware-configuration.nix

    ../../options/cpu.nix

    ../../modules/audio.nix
    ../../modules/backlight
    ../../modules/network.nix
    ../../modules/nix.nix
    ../../modules/nix-ld.nix
    ../../modules/xserver
    ../../modules/zsh.nix

    # https://community.frame.work/t/egpu-issues-with-amd-fw-16/48482/26
    # 6.8.8 or somewhere around there brought thunderbolt changes broke eGPU
    { boot.kernelParams = [ "thunderbolt.host_reset=0" ]; }

    {
      services.tailscale.enable = true;
      services.tailscale.openFirewall = false;
      services.tailscale.authKeyFile = ./tailscale.key;
    }

    {
      documentation.nixos.options.warningsAreErrors = false;
    }

    {
      programs.dconf.enable = true;

      home-manager.useUserPackages = true;
      home-manager.useGlobalPkgs = true;
      home-manager.verbose = true;
      home-manager.extraSpecialArgs = {
        inherit flakes;
        systemConfig = config;
      };

      programs.hyprland.enable = true;
      home-manager.users.${user}.imports = [ ./user.nix ];
      services.logind.extraConfig = ''
        [Login]
        HandlePowerKey=ignore
      '';

      users.users.${user} = {
        uid = 1000;
        createHome = true;
        isNormalUser = true;
        useDefaultShell = true;
        home = "/home/${user}";
        hashedPassword = "$6$enDONNV9bIxtMQCH$W37.LnyBGS.zTR43CwbRZ8XlBjb23pAajVoebg/CsSfYl8Natix3PudLQ52w/uN.5lnv4MWNhlSUZIaeKZNGv/";
        group = "users";
        extraGroups = [
          "kvm"
          "disk" # block device access
          "tss" # tpm device access
          "audio"
          "wheel"
          "docker"
          "plugdev"
          "libvirtd"
          "networkmanager"
          "systemd-journal"
        ];
      };

      imports = [
        {
          services.xserver.displayManager.lightdm.enable = false;
          services.xserver.displayManager.lightdm.greeters.enso.enable = true;
          services.xserver.displayManager.lightdm.greeters.gtk.enable = false;

          services.displayManager.sddm.enable = true;
        }

        {
          environment.systemPackages = [ pkgs.typst ];
          environment.pathsToLink = [ "/share/fonts" ];
          environment.sessionVariables.TYPST_FONT_PATHS =
            let
              aggregatedFonts = pkgs.buildEnv {
                name = "system-fonts";
                paths = config.fonts.packages;
                pathsToLink = [ "/share/fonts" ];
              };
            in
            aggregatedFonts + "/share/fonts";
        }

        {
          environment.persistence."/persist".users.${user} = {
            directories = [
              { directory = ".config/discordcanary"; mode = "0700"; }
              { directory = ".config/vivaldi-snapshot"; mode = "0700"; }
              { directory = ".gnupg"; mode = "0700"; }
              { directory = ".password-store"; mode = "0700"; }
              { directory = ".ssh"; mode = "0700"; }
              { directory = ".thunderbird"; mode = "0700"; }

              { directory = "Anime"; mode = "0700"; }
              { directory = "Desktop"; mode = "0700"; }
              { directory = "Documents"; mode = "0700"; }
              { directory = "Downloads"; mode = "0700"; }
              { directory = "Manga"; mode = "0700"; }
              { directory = "Music"; mode = "0700"; }
              { directory = "Projects"; mode = "0700"; }
              { directory = "Videos"; mode = "0700"; }
            ];

            files = [ ];
          };
          environment.persistence."/cache".users.${user} = {
            directories = [
              { directory = ".cargo"; mode = "0700"; }
              { directory = ".cache/huggingface"; mode = "0700"; }
              { directory = ".cache/nix-index"; mode = "0700"; }
              { directory = ".cache/pypoetry"; mode = "0700"; }
              { directory = ".local/lib/vivaldi-snapshot"; mode = "0700"; }
              # TODO: Needed for home-manager, should probably be tmpfs without any risk of breakage though
              { directory = ".local/state/nix/profiles"; mode = "0700"; }

              { directory = "micromamba"; mode = "0700"; }
            ];

            files = [
              { file = ".config/pavucontrol.ini"; parentDirectory.mode = "0700"; }
              { file = ".cache/rofi3.druncache"; parentDirectory.mode = "0700"; }

              { file = ".wakatime.cfg"; }
              { file = ".zsh_history"; }
            ];
          };
        }
      ];
    }

    {
      environment.systemPackages = with pkgs; [
        moonlight-qt
        tigervnc

        nmap

        framework-tool

        ffmpeg
        nvme-cli
        smartmontools

        gcc

        micromamba
        nixpkgs-fmt
        gitFull
        pavucontrol
        htop
        iotop
        ripgrep
        pass
        vim
        nix-index

        go
        poetry
        protobuf

        cargo-edit
        (with fenix; combine [
          stable.toolchain
          targets.aarch64-unknown-linux-gnu.stable.rust-std
          targets.x86_64-apple-darwin.stable.rust-std
          targets.x86_64-pc-windows-gnu.stable.rust-std
          targets.x86_64-pc-windows-msvc.stable.rust-std
          targets.x86_64-unknown-linux-gnu.stable.rust-std
          targets.aarch64-apple-darwin.stable.rust-std
          targets.x86_64-unknown-linux-musl.stable.rust-std
          targets.wasm32-unknown-emscripten.stable.rust-std
          targets.wasm32-unknown-unknown.stable.rust-std
          targets.wasm32-wasi.stable.rust-std
        ])
        rust-analyzer

        zigpkgs.master
        stdenv.cc.cc.lib
      ];
    }

    {
      hardware.bluetooth.enable = true;
    }

    {
      hardware.sane.enable = lib.mkDefault true;
      hardware.sane.extraBackends = with pkgs; [
        # hplip
        brlaser
      ];
    }

    {
      services.printing.enable = true;
      services.printing.webInterface = true;
      services.printing.drivers = with pkgs; [
        # hplip
        brlaser
      ];
    }

    {
      boot.kernelParams = [
        # https://www.reddit.com/r/zfs/comments/164ue7v/system_responsiveness_hiccups/?rdt=40418
        # https://github.com/openzfs/zfs/issues/13409
        "spl.spl_taskq_thread_priority=0"

        # Check for illegally modified ARC buffers, verifying checksums in memory as well
        "zfs.zfs_flags=0x10"

        # https://github.com/openzfs/zfs/issues/15526#issuecomment-1823737998
        "zfs.zfs_dmu_offset_next_sync=0"
        "zfs.zfs_bclone_enabled=0"
      ];

      boot.supportedFilesystems = [ "zfs" ];
      boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;

      boot.zfs.requestEncryptionCredentials = true;
      boot.zfs.package = pkgs.zfs;
      boot.zfs.forceImportRoot = false; # needed if networking.hostId changes or not cleanly exported

      services.zfs.autoSnapshot.enable = true;
      services.zfs.autoScrub.enable = true;

      # head -c4 /dev/random | od -A none -t x4
      # od -A none -t x4 -N 4 /dev/random
      networking.hostId = "519a0f15";
    }

    {
      fonts.fontDir.enable = true;
      fonts.fontconfig.defaultFonts =
        {
          monospace = [ "Liberation Mono" ];
          sansSerif = [ "Liberation Sans" ];
          serif = [ "Liberation Serif" ];
          emoji = [ "Unifont" ] ++ options.fonts.fontconfig.defaultFonts.emoji.default;
        };
      fonts.packages = with pkgs;
        [
          anonymousPro
          eb-garamond
          cascadia-code
          comfortaa
          corefonts
          font-awesome_6
          font-awesome_5
          ibm-plex
          lato
          liberation_ttf
          nerdfonts
          noto-fonts-cjk-sans
          noto-fonts-cjk-serif
          recursive
          unifont
          weather-icons

          intel-one-mono

          comic-mono
          ludusavi
          material-icons
          material-design-icons
        ];
    }

    {
      services.throttled.enable = true;

      nixos.settings.machine.cpu.tdp = {
        p1.watts = 20; # 28
        p1.duration = 28.0;
        p2.watts = 64;
        p2.duration = 0.00244140625;
      };

      nixos.settings.machine.cpu.undervolt = rec {
        core = 0;
        gpu = 0;
        cache = core;
        uncore = core;
        analogio = core;
      };
    }

    {
      environment.sessionVariables.LD_LIBRARY_PATH = [
        "/run/opengl-driver/lib"
      ];
      environment.systemPackages = with pkgs; [
        glslang
        vulkan-headers
        vulkan-loader
        vulkan-validation-layers
        vulkan-tools
      ];

      hardware.graphics.enable = true;
    }

    {
      boot.kernelParams = [
        # Enable power-saving display C-states
        "i915.enable_dc=1"
        # Enable frame buffer compression for power savings
        "i915.enable_fbc=1"
        # Enable PSR
        "i915.enable_psr=1"
        # Display power wells are always on
        "i915.disable_power_well=0"
      ];

      environment.systemPackages = with pkgs; [
        intel-gpu-tools
        libva-utils
      ];

      hardware.graphics.extraPackages = with pkgs; [
        intel-vaapi-driver
        intel-media-driver
        libvdpau-va-gl
        intel-compute-runtime
      ];

      services.xserver.videoDrivers = [ "modesetting" ];
    }

    {
      imports = [
        # # nouveau with Zink
        # {
        #   boot.kernelParams = [ "nouveau.config=NvGspRm=1" ];
        #   boot.initrd.availableKernelModules = [ "nouveau" ];
        #   environment.variables.NOUVEAU_USE_ZINK = "1";
        # }

        # Manufacturer NVIDIA driver
        {
          # nvidia_uvm is needed for CUDA
          boot.kernelModules = [ "nvidia_uvm" ];

          boot.initrd.availableKernelModules = [
            "nvidia"
            "nvidia_drm"
            "nvidia_uvm"
            "nvidia_modeset"
          ];

          boot.blacklistedKernelModules = [
            "nouveau"
            "nvidiafb"
          ];

          hardware.nvidia.open = true; # Open GPU Modules
          hardware.nvidia.modesetting.enable = true;
          hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
          hardware.nvidia.nvidiaPersistenced = true;
          hardware.nvidia.powerManagement.enable = true;
          hardware.nvidia.powerManagement.finegrained = true;

          services.xserver.videoDrivers = [ "nvidia" ];

          imports = [
            # NVIDIA offload
            (
              let
                nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
                  export __NV_PRIME_RENDER_OFFLOAD=1
                  export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
                  export __GLX_VENDOR_LIBRARY_NAME=nvidia
                  export __VK_LAYER_NV_optimus=NVIDIA_only
                  exec -a "$0" "$@"
                '';
              in
              {
                hardware.nvidia.prime.intelBusId = "PCI:0:2:0";
                hardware.nvidia.prime.nvidiaBusId = "PCI:127:0:0"; # "PCI:7f:0:0";

                hardware.nvidia.prime.offload.enable = true;
                environment.systemPackages = [ nvidia-offload ];
              }
            )
          ];
        }

        {
          environment.systemPackages = with pkgs;
            [
              glxinfo
              vdpauinfo
              nvtopPackages.full
            ];

          hardware.graphics.extraPackages = with pkgs; [
            libva-vdpau-driver
            libvdpau-va-gl
          ];
        }
      ];
    }

    {
      environment.systemPackages = [ pkgs.piper ];
      hardware.logitech.lcd.enable = true;
      hardware.logitech.wireless.enable = true;
      hardware.logitech.wireless.enableGraphical = true;
    }

    {
      boot.kernelParams = [ "transparent_hugepage=madvise" ];
      boot.kernel.sysfs.sys.kernel.mm.transparent_hugepage.enabled = "madvise";
      boot.kernel.sysfs.sys.kernel.mm.transparent_hugepage.defrag = "madvise"; # "defer+madvise"
      # Control system wide THP configuration for all tmpfs mounts
      boot.kernel.sysfs.sys.kernel.mm.transparent_hugepage.shmem_enabled = "within_size"; # advise
    }

    {
      # Should have been from tpm2-tss if wasn't removed
      services.udev.extraRules = ''
        # tpm devices can only be accessed by the tss user but the tss
        # group members can access tpmrm devices
        KERNEL=="tpm[0-9]*", TAG+="systemd", MODE="0660", OWNER="tss"
        KERNEL=="tpmrm[0-9]*", TAG+="systemd", MODE="0660", GROUP="tss"
      '';

      users.users.tss = { isSystemUser = true; group = "tss"; };
      users.groups.tss = { };
    }

    {
      system.systemBuilderCommands =
        let
          kernel = config.boot.kernelPackages.kernel.outPath;
          kernelDev = config.boot.kernelPackages.kernel.dev.outPath;

          kernelFile = config.system.boot.loader.kernelFile;
        in
        lib.mkAfter ''
          ln -s ${kernel}/${kernelFile} $out/${kernelFile}
          ln -s ${kernelDev}/vmlinux $out/vmlinux
        '';
    }
  ];

  boot.initrd.compressor = "${lib.getBin pkgs.zstd}/bin/zstd";
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.editor = false;
  boot.loader.systemd-boot.memtest86.enable = true;

  boot.tmp.cleanOnBoot = true;
  boot.tmp.useTmpfs = true;
  boot.supportedFilesystems = [
    "nfs"
    "nfs4"
    "ntfs"
  ];

  console.font = "ter-u28n";
  console.packages = [ pkgs.terminus_font ];

  environment.sessionVariables.LD_LIBRARY_PATH = [
    "/run/current-system/sw/lib"
  ];

  fonts.fontconfig.antialias = true;

  networking.hostName = "compage";
  networking.nftables.enable = true;
  networking.firewall.allowPing = false;

  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.pinentryPackage = pkgs.pinentry-all;

  time.timeZone = "America/New_York";

  users.defaultUserShell = "${pkgs.zsh}/bin/zsh";
  users.mutableUsers = false;

  networking.blacklistHosts = [
    # If you're part of an organization who wants to control access to Remote Tunnels,
    # you can do so by allowing or denying access to the domain global.rel.tunnels.api.visualstudio.com.
    # *.tunnels.api.visualstudio.com
    # *.devtunnels.ms
    "global.rel.tunnels.api.visualstudio.com"
    "devtunnels.ms"
    "tunnels.api.visualstudio.com"
  ];

  networking.whitelist = [
    # NVIDIA Store
    "^api.nvidia.partners$"

    # MangaUpdate
    "^www.mangaupdates.com$"

    # Crunchyroll download
    "^fy.v.vrv.co$"
    # DNS Resolution service for above
    "^ellation.map.fastly.net$"

    # Relics from eadwu/flakes
    "^[^.]*$" # if there isn't any dots, it probably isn't a domain
    "^.*%.*$" # invalid character
    "^://.*/.*$" # invalid domain
    "^www.rarlab.com$" # RAR archiver source...
    "^stats.stackexchange.com$" # stackexchange...
    "^tags.tiqcdn.com$" # weather.com
    "^lists.gnu.org$" # GNU...
    "^[^.]*.googlevideo.com$" # Youtube providers
    "(^boards.|^)4chan.org$" # need anything be said...

    # weather.com videos
    "^v.w-x.co$"
    # UB Box, buffalo.app.box.com
    "^app.box.com$"
    # Akuna Capital
    "^greenhouse.io$"
    "^boards.greenhouse.io$"
    # Wattpad
    "^www.wattpad.com$"
    # yeet
    "^files.catbox.moe$"
    # "^groups.csail.mit.edu$"
    "^aditsachde.com$"
    "^.*.mathworks.com.*$"
    # Imgur
    "^t.imgur.com$"

    "^.*.homedepot.com.*$"
    "^www.lemonade.com$"
    "^.*.alaskaair.com.*$"

    # Job Applications
    "^account.amazon.jobs$"
    "^qualtrics.com$"
    "^salesforce.com$"
    "^uhf.microsoft.com$"
    "^careers.tiktok.com$"
  ];

  environment.persistence."/persist" = {
    directories = [ ];
    files = [ ];
  };
  environment.persistence."/cache" = {
    directories = [
      { directory = "/var/lib/alsa"; mode = "0755"; user = "root"; group = "root"; }
      { directory = "/var/lib/bluetooth"; mode = "0755"; user = "root"; group = "root"; }
    ];
    files = [ ];
  };
}
