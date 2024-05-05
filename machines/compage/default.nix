{ flakes, nixosModules, config, pkgs, lib, ... }:

let
  rootTmpfsModule = {
    fileSystems."/" = {
      device = "none";
      fsType = "tmpfs";
      options = [ "noatime" "nodiratime" ];
    };
  };

  damonMemoryReclamation = {
    # https://hocus.dev/blog/qemu-vs-firecracker/
    # https://lore.kernel.org/damon/20230504171749.89225-1-sj@kernel.org/T/
    boot.kernelParams = [
        "page_reporting.page_reporting_order=0"
        "damon_reclaim.enabled=Y"
        "damon_reclaim.min_age=10000000" # 120000000
        "damon_reclaim.quota_ms=16" # 10
        "damon_reclaim.quota_sz=1024000000" # 128000000
        "damon_reclaim.quota_reset_interval_ms=1000" # 1000000
        "damon_reclaim.wmarks_high=1000"
        "damon_reclaim.wmarks_mid=999"
        "damon_reclaim.wmarks_low=0"
        "damon_reclaim.monitor_region_start=0"
    ];
  };

  baseVMModules = [
    rootTmpfsModule
    damonMemoryReclamation
    flakes.impermanence.nixosModules.impermanence
  ];
  baseVMMModules = baseVMModules ++ [
    { boot.kernelParams = [ "transparent_hugepages=never" ]; }
    { boot.kernelPackages = config.boot.kernelPackages; }
    # It is highly recommended to share the host's nix-store
    # with the VMs to prevent building huge images.
    { microvm.shares = [ {
      source = "/nix/store";
      mountPoint = "/nix/.ro-store";
      tag = "ro-store";
      proto = "virtiofs";
    } ]; }
  ];
in
with config.nixos;
{
  specialisation.headless.configuration.imports = [
    {
      # programs.ssh.extraConfig = ''
      #  NoHostAuthenticationForLocalhost yes
      # '';

      # Don't restart ssh during system activation
      systemd.services.${
        if config.services.openssh.startWhenNeeded then "sshd@" else "sshd"
      }.restartIfChanged = lib.mkForce false;

      # Enable SSH
      services.openssh.enable = true;
      services.openssh.startWhenNeeded = false;
      # services.openssh.allowSFTP = true;
      services.openssh.ports = [ 22 ];
      services.openssh.openFirewall = true;
      # services.openssh.settings.X11Forwarding = false;
      # services.openssh.settings.PermitRootLogin = "no";
      # services.openssh.settings.PermitEmptyPasswords = "no";
      # services.openssh.settings.AllowUsers = [];
      # security.pam.services.sshd.allowNullPassword = true;

      # No X11 forwarding over SSH
      # programs.ssh.forwardX11 = false;
      # programs.ssh.setXAuthLocation = false;
      # security.pam.services.su.forwardXAuth = lib.mkForce false;
    }
  ];

  imports =
    [
      ./default/hardware-configuration.nix

      ../../profiles/desktop.nix

      ../../hardware/profiles/intel.nix

      ../../hardware/gpu/nvidia
      # ../../hardware/gpu/nvidia/disable
      ../../hardware/gpu/nvidia/offload
      # ../../hardware/gpu/nvidia/sync

      # ../../hardware/profiles/yubikey.nix
      ../../hardware/profiles/laptop.nix
      ../../hardware/profiles/uefi.nix
      ../../hardware/profiles/linux.nix

      flakes.impermanence.nixosModules.impermanence
      flakes.microvm.nixosModules.host

      ./nixos-hardware.nix
      ../../modules/nix-ld.nix

      ../../modules/xserver
      {
        home-manager.users."${config.nixos.settings.system.user}".imports = [ {
          wayland.windowManager.hyprland.enable = true;
        } (rec {
          # systemd.user.timers = lib.genAttrs
          #   (builtins.attrNames systemd.user.services)
          #   (service: {
          #     Install.WantedBy = [ "timers.target" ];

          #     Unit.Description = "Sync ${service} every 30 minutes";
          #     Timer.OnUnitActiveSec = "1h";
          #   });

          # systemd.user.services =
          #   let
          #     syncScript = pkgs.writeShellScriptBin "shm-sync" ''
          #       src="$1"
          #       dest="$2"

          #       if [ ! -r "$dest" ]; then
          #         die "Shm directory is missing!"
          #       fi

          #       if [ -e "$dest/.unpacked" ]; then
          #         ${pkgs.rsync}/bin/rsync -av --delete --exclude .unpacked "$dest" "$src"
          #       else
          #         ${pkgs.rsync}/bin/rsync -av "$src" "$dest"
          #         ${pkgs.coreutils}/bin/touch "$dest/.unpacked"
          #       fi
          #     '';

          #     shmService = { src, dest, description, ... }@attrs:
          #       let
          #         _attrs = builtins.removeAttrs attrs [ "src" "dest" "description" ];
          #       in
          #       lib.recursiveUpdate
          #         {
          #           Install.WantedBy = [ "default.target" ];

          #           Unit.Description = description;
          #           Service = rec {
          #             Type = "oneshot";
          #             ExecStart = ''${syncScript}/bin/shm-sync "${src}" "${dest}"'';
          #           };
          #         }
          #         _attrs;
          #   in
          #   {
          #     shm-vivaldi-profile = shmService {
          #       src = "/persist/home/framework/.config/vivaldi-snapshot/";
          #       dest = "/dev/shm/vivaldi/profile/";
          #       description = "Vivaldi-snapshot profile shared memory";
          #     };
          #   };

          systemd.user.tmpfiles.rules = [
            "L+ %h/.cache/vivaldi-snapshot   - - - - /dev/null"
            # # On RAM
            # "d /dev/shm/vivaldi/cache                2770 - users -"
            # "d /dev/shm/vivaldi/profile              2770 - users -"
            # # "d /persist/home/.config/vivaldi         2770 - users -"
            # "L+ %h/.cache/vivaldi-snapshot   - - - - /dev/shm/vivaldi/cache"
            # "L+ %h/.config/vivaldi-snapshot  - - - - /dev/shm/vivaldi/profile"
          ];
        })];
      }

      { environment.systemPackages = [ pkgs.zlib ]; }

      { boot.kernelParams = [ "nouveau.config=NvGspRm=1" ]; }

      {
        boot.initrd.availableKernelModules = [
          # https://github.com/nixos/nixpkgs/issues/9899#issuecomment-162539673
          "hv_vmbus" "hv_storvsc"
          # https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/hyperv-guest.nix
          "hv_balloon" "hv_netvsc" "hv_storvsc" "hv_utils" "hv_vmbus" "hyperv_keyboard"
        ];
        virtualisation.hypervGuest.enable = true;
        virtualisation.hypervGuest.videoMode = "1920x1080";
      }

      # {
      #   services.sunshine.enable = true;
      #   services.sunshine.package = pkgs.sunshine.override { cudaSupport = true; };
      #   services.sunshine.openFirewall = false;
      #   services.sunshine.capSysAdmin = true;
      #   services.sunshine.settings = {};
      #   services.sunshine.applications = {};

      #   environment.systemPackages = with pkgs; [ moonlight-embedded moonlight-qt ];
      # }

      # { boot.kernel.sysctl."sched_autogroup_enabled" = "0"; }

      # # ../caelus/modules/kresd.nix
      # {
      #   microvm.vms.knot-resolver.pkgs = pkgs;
      #   microvm.vms.knot-resolver.autostart = false;
      #   microvm.vms.knot-resolver.restartIfChanged = false;
      #   microvm.vms.knot-resolver.config.imports = baseVMMModules ++ [ {
      #     system.stateVersion = config.system.nixos.version;

      #     microvm.vcpu = 2;
      #     microvm.mem = 512;
      #     #microvm.balloonMem = 1024;
      #     microvm.hypervisor = "cloud-hypervisor";
      #     microvm.interfaces = [ {
      #       type = "tap";
      #       id = "kresd";
      #       mac =
      #         let
      #           vmmIdentifier = "knot-resolver";
      #           hash = builtins.hashString "sha256" vmmIdentifier;
      #           c = off: builtins.substring off 2 hash;
      #         in "${builtins.substring 0 1 hash}2:${c 2}:${c 4}:${c 6}:${c 8}:${c 10}";
      #     } ];
      #     # microvm.forwardPorts = [ {
      #     #   from = "host";
      #     #   proto = "udp";
      #     #   host.address = "127.0.0.1";
      #     #   host.port = 53;
      #     #   guest.address = "127.0.0.1";
      #     #   guest.port = 53;
      #     # } {
      #     #   from = "host";
      #     #   proto = "tcp";
      #     #   host.address = "127.0.0.1";
      #     #   host.port = 853;
      #     #   guest.address = "127.0.0.1";
      #     #   guest.port = 853;
      #     # } {
      #     #   from = "host";
      #     #   proto = "tcp";
      #     #   host.address = "127.0.0.1";
      #     #   host.port = 8453;
      #     #   guest.address = "127.0.0.1";
      #     #   guest.port = 8453;
      #     # } ];

      #     # Just use 99-ethernet-default-dhcp.network
      #     systemd.network.enable = true;

      #     environment.etc."kresd/hosts.rpz".source = let
      #       hosts-rpz = pkgs.runCommand "etc-hosts-rpz" {
      #         src = config.environment.etc.hosts.source;
      #         nativeBuildInputs = with pkgs; [ perl gawk gnused ripgrep coreutils ];
      #       } ''
      #         rg . $src | rg -v '^#' | awk '{print $2}' | \
      #           perl -pe 's@\r\n$@\n@g' | sort | uniq | \
      #           sed 's@$@\tCNAME\t.@' > $out
      #       '';
      #     in hosts-rpz;

      #     services.kresd.enable = true;
      #     services.kresd.listenPlain = [ "[::1]:53" "127.0.0.1:53" ];
      #     services.kresd.listenTLS = [ "[::1]:853" "127.0.0.1:853" ];
      #     services.kresd.extraConfig = ''
      #       net.listen({'::1', '127.0.0.1'}, 8453, { kind = 'webmgmt', freebind = true })

      #       -- Get instance identifier - in this case from systemd from kresd@{ID}
      #       local systemd_instance = os.getenv("SYSTEMD_INSTANCE")
      #       modules.load('nsid')
      #       nsid.name(systemd_instance)

      #       modules = {
      #         'http', -- HTTP module with defaults (self-signed TLS cert)
      #         'policy', -- manipulate request handling
      #         'prefill', -- provides ability to prefill the DNS cache
      #         'stats', -- Track internal statistics
      #         'hints > iterate', -- Allow loading /etc/hosts or custom root hints
      #         'predict', -- identify usage patterns and preemptively refresh expired queries
      #         'serve_stale < cache', -- allows expired entries to be served from the cache
      #         'workarounds < iterate', -- contains a set of hotfixes to ensure compatibility

      #         -- stats collection using Graphite over InfluxDB
      #         graphite = {
      #           host = { '::1', '127.0.0.1' },
      #           port = 2003,
      #           -- send over TCP
      #           tcp = true,
      #           -- optional metric prefix
      #           prefix = 'kresd' .. '.' .. hostname() .. '.' .. nsid.name(),
      #           -- publish interval
      #           interval = 1 * sec,
      #         },
      #       }

      #       -- Force requestor to use TCP.
      #       -- It sets truncated bit (TC) in response to true if the request came through UDP,
      #       --   which will force standard-compliant clients to retry the request over TCP.
      #       -- policy.add(policy.all(policy.TC))

      #       -- Cache size
      #       cache.size = 128 * MB

      #       -- Prefetch learning (20-minute blocks over 24 hours)
      #       -- Drop due to use on WSL, might be causing more problems than expected ...
      #       predict.config({ window = 20, period = 18 * (60 / 15) })

      #       -- Use local root server copy for performance reasons (root hints are included on NixOS via command line)
      #       -- hints.root({
      #       --   ['j.root-servers.net.'] = { '192.168.1.4', '2001:503:c27::2:30', '192.58.128.30' }
      #       -- })

      #       -- Speed monitor
      #       local ffi = require('ffi')

      #       -- log statistics every second
      #       local stat_id = event.recurrent(1 * second, function(evid)
      #           log_info(ffi.C.LOG_GRP_STATISTICS, table_print(stats.list()))
      #       end)

      #       -- stop printing statistics after first minute
      #       event.after(1 * minute, function(evid)
      #               event.cancel(stat_id)
      #       end)

      #       -- speed_monitor definition
      #       -- prints warning if more than 5% of total answers was slow
      #       function speed_monitor()
      #               local previous = stats.list()   -- store statistics in persistent variable
      #               return function(evid)
      #                       local now = stats.list()    -- save actual statistics to variable
      #                       -- number of total answers between 'now' and 'previous' states
      #                       local total_increment = now['answer.total'] - previous['answer.total']
      #                       -- number of slow answers between 'now' and 'previous' states
      #                       local slow_increment = now['answer.slow'] - previous['answer.slow']
      #                       -- if percentage of slow answers is bigger than 5%, print warning
      #                       if slow_increment / total_increment > 0.05 then
      #                               log_warn(ffi.C.LOG_GRP_STATISTICS, 'WARNING! More than 5 %% of queries was slow!')
      #                       end
      #                       previous = now
      #               end
      #       end

      #       -- execute speed_monitor every minute
      #       local monitor_id = event.recurrent(1 * minute, speed_monitor())

      #       -- Prefill root zone data
      #       local prefill_root = coroutine.wrap(function ()
      #         prefill.config({
      #           ['.'] = {
      #             url = 'https://www.internic.net/domain/root.zone',
      #             interval = 86400, -- 1 day is roughly 86400 seconds
      #             ca_file = '/etc/ssl/certs/ca-certificates.crt'
      #           }
      #         })
      #       end)
      #       prefill_root()

      #       -- If /etc/hosts is too big, hints.add_hosts() fails and causes resource issues, so it's recommended to use `policy.rpz`
      #       -- If every program respect nsswitch this wouldn't be a problem but some don't
      #       -- So we convert /etc/hosts into it's RPZ equivalent and watch for changes to keep them in sync
      #       -- We don't need to keep the file in sync because it's generated through a Nix derivation
      #       -- https://wiki.archlinux.org/index.php/Domain_name_resolution
      #       local load_rpz = coroutine.wrap(function ()
      #         -- Pretty-print DNS responses from upstream servers (or cache) into logs
      #         policy.add(policy.rpz(policy.DEBUG_ALWAYS, '/etc/kresd/hosts.rpz', false))
      #         policy.add(policy.rpz(policy.QTRACE, '/etc/kresd/hosts.rpz', false))
      #         -- policy.add(policy.rpz(policy.REQTRACE, '/etc/kresd/hosts.rpz', false))
      #         -- policy.add(policy.rpz(policy.IPTRACE, '/etc/kresd/hosts.rpz', false))

      #         -- Terminate query resolution and return REFUSED to the requestor.
      #         -- policy.add(policy.rpz(policy.REFUSE, '/etc/kresd/hosts.rpz', false))

      #         -- Deny existence of names matching filter, i.e. reply NXDOMAIN authoritatively.
      #         -- policy.add(policy.rpz(policy.DENY, '/etc/kresd/hosts.rpz', false))
      #       end)
      #       load_rpz()

      #       --[[
      #       -- Forward queries through Cloudflare
      #       policy.add(policy.TLS_FORWARD({
      #         { '2606:4700:4700::1113', hostname = 'family.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
      #         { '2606:4700:4700::1003', hostname = 'family.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
      #         { '1.1.1.3', hostname = 'family.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
      #         { '1.0.0.3', hostname = 'family.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
      #       }))
      #       --]]

      #       -- Forward queries through Cloudflare and Quad9
      #       policy.add(policy.slice(
      #         policy.slice_randomize_psl(),
      #         -- Block malware and adult content
      #         policy.TLS_FORWARD({
      #           { '2606:4700:4700::1113', hostname = 'family.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
      #           { '1.1.1.3', hostname = 'family.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
      #         }),
      #         policy.TLS_FORWARD({
      #           { '2606:4700:4700::1003', hostname = 'family.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
      #           { '1.0.0.3', hostname = 'family.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
      #         })
      #         --[[
      #         -- Block malware
      #         policy.TLS_FORWARD({
      #           { '2606:4700:4700::1112', hostname = 'security.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
      #           { '1.1.1.2', hostname = 'security.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
      #         }),
      #         policy.TLS_FORWARD({
      #           { '2606:4700:4700::1002', hostname = 'security.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
      #           { '1.0.0.2', hostname = 'security.cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
      #         }),
      #         -- No DNS server filter
      #         policy.TLS_FORWARD({
      #           { '2606:4700:4700::1111', hostname = 'cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
      #           { '1.1.1.1', hostname = 'cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
      #         }),
      #         policy.TLS_FORWARD({
      #           { '2606:4700:4700::1001', hostname = 'cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
      #           { '1.0.0.1', hostname = 'cloudflare-dns.com', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
      #         }),
      #         policy.TLS_FORWARD({
      #           { '2620:fe::fe', hostname = 'dns.quad9.net', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
      #           { '9.9.9.9', hostname = 'dns.quad9.net', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
      #         }),
      #         policy.TLS_FORWARD({
      #           { '2620:fe::9', hostname = 'dns.quad9.net', ca_file = '/etc/ssl/certs/ca-certificates.crt' },
      #           { '149.112.112.112', hostname = 'dns.quad9.net', ca_file = '/etc/ssl/certs/ca-certificates.crt' }
      #         })
      #         --]]
      #       ))
      #     '';
      #   } ];
      # }

      ../aspectum/config.nix
      ../aspectum/modules/victoriametrics.nix
      {
        systemd.services.victoriametrics.wantedBy = lib.mkForce [];
        systemd.services.victoriametrics.serviceConfig.SuccessExitStatus = "SIGINT";
        systemd.services.victoriametrics.serviceConfig.Type = lib.mkForce "oneshot";
        systemd.services.victoriametrics.serviceConfig.StateDirectory = lib.mkForce "victoriametrics_unused";
        systemd.services.victoriametrics.serviceConfig.DynamicUser = lib.mkForce false;
        systemd.services.victoriametrics.serviceConfig.User = lib.mkForce "victoriametrics";
        systemd.services.victoriametrics.serviceConfig.Group = lib.mkForce "victoriametrics";
        users.users.victoriametrics = {
          isSystemUser = true;
          group = "victoriametrics";
        };
        users.groups.victoriametrics = {};
      }
      # {
      #   microvm.vms.victoriametrics-production.pkgs = pkgs;
      #   microvm.vms.victoriametrics-production.autostart = false;
      #   microvm.vms.victoriametrics-production.restartIfChanged = false;
      #   microvm.vms.victoriametrics-production.config.imports = baseVMMModules ++ [ {
      #     system.stateVersion = config.system.nixos.version;

      #     microvm.vcpu = 12;
      #     microvm.mem = 512;
      #     # microvm.balloonMem = 16384;
      #     microvm.hypervisor = "cloud-hypervisor";
      #     # microvm.forwardPorts = [ {
      #     #   from = "host";
      #     #   proto = "tcp";
      #     #   host.address = "127.0.0.1";
      #     #   host.port = 8428;
      #     #   guest.address = "127.0.0.1";
      #     #   guest.port = 8428;
      #     # } ];

      #     services.victoriametrics.enable = true;
      #     services.victoriametrics.listenAddress = "127.0.0.1:8428";
      #     services.victoriametrics.retentionPeriod = 1200; # 100 years
      #     services.victoriametrics.extraOptions = let
      #       queryLimit = toString (1024 * 1024);
      #     in [
      #       # Compatible metric names ... so it can be accessed without hacks
      #       # Replaces `.` with `_` - which is not great...
      #       # "-usePromCompatibleNaming"
      #       # Log own metrics
      #       "-selfScrapeInterval=10s"
      #       # Limit memory (internal cache) usage to 8%
      #       # "-memory.allowedPercent=8"
      #       "-sortLabels"
      #       # Don't polyfill any gaps bigger
      #       "-search.setLookbackToStep"
      #       # Remove query limits outside of auto-kills
      #       # "-search.maxUniqueTimeseries=${queryLimit}"
      #       # "-search.maxSamplesPerSeries=${queryLimit}"
      #       # "-search.maxSamplesPerQuery=${queryLimit}"
      #       # "-search.maxPointsPerTimeseries=${queryLimit}"
      #       # "-search.maxPointsSubqueryPerTimeseries=${queryLimit}"
      #       # "-search.maxSeries=${queryLimit}"
      #       # "-search.maxTagKeys=${queryLimit}"
      #       # "-search.maxTagValues=${queryLimit}"
      #       # "-search.maxTagValueSuffixesPerSearch=${queryLimit}"
      #     ];

      #     # Give it 4m at most to gracefully stop
      #     systemd.services.victoriametrics.serviceConfig.KillSignal = "SIGINT";
      #     systemd.services.victoriametrics.serviceConfig.TimeoutStopSec = "4m";
      #     # systemd.slices.victoriametrics.sliceConfig.MemoryAccounting = true;
      #     # systemd.slices.victoriametrics.sliceConfig.MemoryHigh = "10%";
      #     # systemd.slices.victoriametrics.sliceConfig.MemoryMax = "25%";
      #   } ];

      #   microvm.vms.victoriametrics-testing.pkgs = pkgs;
      #   microvm.vms.victoriametrics-testing.autostart = false;
      #   microvm.vms.victoriametrics-testing.restartIfChanged = false;
      #   microvm.vms.victoriametrics-testing.config.imports = baseVMMModules ++ [ {
      #     system.stateVersion = config.system.nixos.version;

      #     microvm.vcpu = 1;
      #     microvm.mem = 512;
      #     #microvm.balloonMem = 1024;
      #     microvm.hypervisor = "crosvm";
      #     # microvm.forwardPorts = [ {
      #     #   from = "host";
      #     #   proto = "tcp";
      #     #   host.address = "127.0.0.1";
      #     #   host.port = 8429;
      #     #   guest.address = "127.0.0.1";
      #     #   guest.port = 8428;
      #     # } ];

      #     services.victoriametrics.enable = true;
      #     services.victoriametrics.listenAddress = "127.0.0.1:8428";
      #     services.victoriametrics.retentionPeriod = 2;
      #     services.victoriametrics.extraOptions = [
      #       "-selfScrapeInterval=10s"
      #       "-sortLabels"
      #     ];

      #     systemd.services.victoriametrics.serviceConfig.KillSignal = "SIGINT";
      #     systemd.services.victoriametrics.serviceConfig.TimeoutStopSec = "4m";
      #   } ];
      # }

      {
        system.systemBuilderCommands = let
          kernel = config.boot.kernelPackages.kernel.outPath;
          kernelDev = config.boot.kernelPackages.kernel.dev.outPath;

          kernelFile = config.system.boot.loader.kernelFile;
        in lib.mkAfter ''
          ln -s ${kernel}/${kernelFile} $out/${kernelFile}
          ln -s ${kernelDev}/vmlinux $out/vmlinux
        '';
      }

      {
        # boot.initrd.kernelModules = [ "virtio_balloon" "virtio_console" "virtio_rng" ];
        boot.initrd.availableKernelModules = [
          "virtio" "virtio_pci"
          "virtio_balloon" "virtio_console" "virtio_rng"
          "virtio_blk" "virtio_mmio" "virtio_net" "virtio_ring" "virtio_scsi"
          "9p" "9pnet_virtio"
        ];
      }

      {
        environment.systemPackages = [ pkgs.lapce pkgs.wayland-proxy-virtwl ];
      }

      {
        # https://hocus.dev/blog/qemu-vs-firecracker/
        # https://lore.kernel.org/damon/20230504171749.89225-1-sj@kernel.org/T/
        boot.kernelParams = [
          "transparent_hugepage=never"
          "page_reporting.page_reporting_order=0"
          "damon_reclaim.enabled=Y"
          "damon_reclaim.min_age=10000000" # 120000000
          "damon_reclaim.quota_ms=16" # 10
          "damon_reclaim.quota_sz=1024000000" # 128000000
          "damon_reclaim.quota_reset_interval_ms=1000" # 1000000
          "damon_reclaim.wmarks_high=1000"
          "damon_reclaim.wmarks_mid=999"
          "damon_reclaim.wmarks_low=0"
          "damon_reclaim.monitor_region_start=0"
        ];
      }

      {
        environment.systemPackages = with pkgs; [ crosvm sommelier firecracker cloud-hypervisor ];
      }

      {
        # https://community.frame.work/t/solved-sound-issues-on-linux-dummy-output/17560/2
        boot.kernelParams = [
          # "snd-hda-intel.dmic_detect=0"
          # "snd-hda-intel.model=generic"
          # "snd-hda-intel.model=auto"
          # "snd-hda-intel.index=1"
          # snd-intel-dspcfg.dsp_driver=1 or 3
          # "snd-intel-dspcfg.dsp_driver=0"
        ];
        boot.blacklistedKernelModules = ["snd_soc_skl"];
      }

      {
        # boot.kernelPackages = lib.mkOverride (-1000010) pkgs.linuxKernel.packages.linux_wsl_5_15;
      }

      {
        environment.systemPackages = [ pkgs.ratarmount ];
      }

      {
        systemd.oomd.enable = lib.mkForce false;
      }

      {
        boot.kernelParams = [
          "nvidia-modeset.hdmi_deepcolor=1"
        ];
      }

      {
        services.throttled.enable = true;
      }

      {
        environment.systemPackages = with pkgs; [
          parallel libjxl psmisc pv
        ];
      }

      {
        # boot.kernel.sysctl."kernel.sched_bore" = 0;
        boot.kernel.sysctl."kernel.sched_burst_penalty_scale" = 2048;
        boot.kernel.sysctl."kernel.sched_burst_penalty_offset" = 32;
        boot.kernel.sysctl."kernel.sched_burst_fork_atavistic" = 3;
      }

      # https://github.com/openzfs/zfs/issues/15526#issuecomment-1823737998
      { boot.kernelParams = [
        "zfs.zfs_dmu_offset_next_sync=0"
        "zfs.zfs_bclone_enabled=0"
      ]; }

      { environment.systemPackages = [ pkgs.spirv-tools ]; }

      { security.apparmor.enable = lib.mkForce false; }

      { environment.systemPackages = [ pkgs.wireguard-tools ]; }

      {
        environment.systemPackages = [ pkgs.typst ];
        environment.pathsToLink = [ "/share/fonts" ];
        # environment.sessionVariables.TYPST_FONT_PATHS = "/run/current-system/sw/share/fonts";
        environment.sessionVariables.TYPST_FONT_PATHS = let
          aggregatedFonts = pkgs.buildEnv {
            name = "system-fonts";
            paths = config.fonts.packages;
            pathsToLink = [ "/share/fonts" ];
          };
        in aggregatedFonts + "/share/fonts";
      }

      { environment.systemPackages = with pkgs; [ wrangler worker-build wasm-pack ]; }

      # (let
      #   pulsar = with pkgs;
      #     rustPlatform.buildRustPackage rec {
      #       pname = "pulsar";
      #       version = "0.6.0";

      #       src = fetchFromGitHub {
      #         owner = "exein-io";
      #         repo = "pulsar";
      #         rev = "v${version}";
      #         hash = "sha256-hZz4+g0vI21d7xgemX0snkfxeUgPnF+yrPrU7O6YGrY=";
      #       };

      #       cargoLock.lockFile = "${src}/Cargo.lock";
      #       cargoLock.outputHashes = {
      #         "aya-0.11.0" = "sha256-T1ScwBYBRvCH3ODfoypl9qEarZgfCcBGZxLc3d2c71o=";
      #       };

      #       postPatch = ''
      #         # bypass unused argument warning turned error
      #         sed -i 's@-Werror@-fno-stack-protector@' crates/bpf-builder/src/lib.rs
      #       '';

      #       nativeBuildInputs = [ clang_13 llvm_13 lld_13 pkg-config ];
      #       buildInputs = [ openssl ];

      #       doCheck = false;
      #     };
      # in {
      #   environment.systemPackages = [ pulsar ];
      # })

      {
        security.audit.enable = true;
        # security.audit.rules = [
        #   "-a exit,always -F arch=b64 -S execve"
        # ];

        security.auditd.enable = true;
      }

      # {
      #   services.system76-scheduler.enable = true;
      #   services.system76-scheduler.useStockConfig = true;
      # }

      {
        boot.kernelParams = [
          "preempt=full"

          # 1024 * 1024 * 1024 * 8
          # "zfs.zfs_arc_max=8589934592"

          # https://www.reddit.com/r/zfs/comments/164ue7v/system_responsiveness_hiccups/?rdt=40418
          # https://github.com/openzfs/zfs/issues/13409
          "spl.spl_taskq_thread_priority=0"

          # Check for illegally modified ARC buffers, verifying checksums in memory as well
          "zfs.zfs_flags=0x10"
        ];

        # boot.kernelPackages = lib.mkOverride (-1000001) config.boot.zfs.package.latestCompatibleLinuxPackages;
        boot.kernelPackages = lib.mkOverride (-1000001) (pkgs.customLinuxPackagesFor config.boot.zfs.package.latestCompatibleLinuxPackages.kernel);
        boot.supportedFilesystems = [ "zfs" ];
        boot.zfs.requestEncryptionCredentials = true;
        boot.zfs.package = pkgs.zfs_unstable;
        boot.zfs.forceImportRoot = false; # maybe issue if networking.hostId always changes

        services.zfs.autoSnapshot.enable = true;
        services.zfs.autoScrub.enable = true;

        # head -c4 /dev/random | od -A none -t x4
        # od -A none -t x4 -N 4 /dev/random
        networking.hostId = "519a0f15";
        # od -A n -t x8 -N 32 /dev/random | tr -d ' \n'
        # boot.kernel.randstructSeed = "67bcb8237a2a26bc3eb186c44de7a0ac0b613f2467d11731268d2d10385c4084";

        # boot.initrd.postDeviceCommands = lib.mkAfter ''
        #  zfs rollback -r rpool/local/root@blank
        #  zfs rollback -r rpool/local/home@blank
        # '';
      }

      # {
      #   boot.supportedFilesystems = [ "bcachefs" ];
      #   boot.kernelPackages = lib.mkOverride (-1000001) pkgs.linuxPackages_custom;
      #   # boot.kernelPackages = lib.mkOverride (-1000001) pkgs.linuxPackages_testing_bcachefs;

      #   # sudo bcachefs subvolume snapshot /bcachefs/subvolumes/persist /bcachefs/snapshots/persist/$(date --iso-8601=seconds)
      #   systemd.services.bcachefs-snapshot_persist = {
      #     wantedBy = [ "multi-user.target" ];

      #     description = "Bcachefs Snapshot /persist";
      #     serviceConfig.Type = "oneshot";

      #     path = with pkgs; [ coreutils bcachefs-tools ];
      #     script = ''
      #       snapshot_name="$(date --iso-8601=seconds)"
      #       bcachefs subvolume snapshot -r /bcachefs/subvolumes/persist /bcachefs/snapshots/persist/"$snapshot_name"
      #     '';
      #   };

      #   systemd.timers.bcachefs-snapshot_persist = {
      #     wantedBy = [ "timers.target" ];
      #     timerConfig.OnUnitActiveSec = "15m";
      #   };
      # }

      { nix.package = lib.mkForce pkgs.nixVersions.stable; }

      { environment.systemPackages = [ pkgs.smartmontools ]; }

      { environment.systemPackages = [ pkgs.protobuf ]; }

      # { virtualisation.waydroid.enable = true; }

      { environment.systemPackages = [ pkgs.yt-dlp ]; }

      { environment.systemPackages = [ pkgs.b4 ]; }

#       (let
#         windscribe-wireguard-source = ../../windscribe/json;
#         /*
#         # nix-shell -p jc
#         for f in $(find . -type f);
#         do
#           dir="$(dirname "$f")"
#           filename="$(basename "$f" .conf).json"
#           output="$dir/$filename"
#           echo $f $output
#           cat "$f" | jc --ini --pretty > $output
#           rm "$f"
#         done
#         */

#         windscribe-wireguard-configurations = let
#           read-dir-filter = dir: f: builtins.attrNames (lib.filterAttrs f (builtins.readDir dir));
#           tiers = read-dir-filter windscribe-wireguard-source (_: v: v == "directory");
#           files = lib.concatMap
#             (tier: lib.concatMap
#               (file: [{
#                 inherit tier;
#                 filepath = "${windscribe-wireguard-source}/${tier}/${file}";
#                 filename = file;
#               }])
#               (read-dir-filter "${windscribe-wireguard-source}/${tier}" (_: v: v == "regular")))
#             tiers;
#         in lib.imap0 (index: config: config // {
#           inherit index;
#           interface-name = "wg_${config.tier}_${builtins.toString index}";
#           configuration = builtins.fromJSON (builtins.readFile config.filepath);
#         }) files;

#         windscribe-wireguard-netdev = { filename, interface-name, configuration, ... }: {
#           netdevConfig = {
#             Name = interface-name;
#             Kind = "wireguard";
#             # https://keremerkan.net/posts/wireguard-mtu-fixes/
#             MTUBytes = "1280";
#             Description = "Wireguard Interface (${filename})";
#           };
#           wireguardConfig = {
#             inherit (configuration.Interface) PrivateKey;
#             # FirewallMark = 51820;
#           };
#           wireguardPeers = [{ wireguardPeerConfig = {
#             inherit (configuration.Peer) PublicKey Endpoint PresharedKey;
#             AllowedIPs = [ "0.0.0.0/0" "::/0" ];
#             PersistentKeepalive = 15;
#             RouteTable = "off";
#           }; }];
#         };

#         windscribe-windscribe-network = { interface-name, configuration, ... }: {
#           DHCP = "no";
#           linkConfig.ActivationPolicy = "manual";

#           matchConfig.Name = interface-name;
#           networkConfig = {
#             # Dynamically allocated address
#             Address = [ "0.0.0.0/32" ]; # [ configuration.Interface.Address ];
#             # DNS = configuration.Interface.DNS;
#             # Domains = "~.";
#             # DNSDefaultRoute = true;
#             IPv6AcceptRA = false;
#             IPv6PrivacyExtensions = true;
#           };
#         };

# /*
# [#] ip link add wg0 type wireguard
# [#] wg setconf wg0 /dev/fd/63
# [#] ip -4 address add 100.81.69.21/32 dev wg0
# [#] ip link set mtu 1420 up dev wg0
# [#] resolvconf -a wg0 -m 0 -x

# [#] wg set wg0 fwmark 51820
# [#] ip -6 route add ::/0 dev wg0 table 51820
# [#] ip -6 rule add not fwmark 51820 table 51820
# [#] ip -6 rule add table main suppress_prefixlength 0
# [#] ip6tables-restore -n
# [#] ip -4 route add 0.0.0.0/0 dev wg0 table 51820
# [#] ip -4 rule add not fwmark 51820 table 51820
# [#] ip -4 rule add table main suppress_prefixlength 0
# [#] sysctl -q net.ipv4.conf.all.src_valid_mark=1
# [#] iptables-restore -n

# [#] ip -4 rule delete table 51820
# [#] ip -4 rule delete table main suppress_prefixlength 0
# [#] ip -6 rule delete table 51820
# [#] ip -6 rule delete table 51820
# [#] ip -6 rule delete table main suppress_prefixlength 0
# [#] ip link delete dev wg0
# [#] resolvconf -d wg0 -f
# [#] iptables-restore -n
# [#] ip6tables-restore -n
# */

#         wg-swarm = pkgs.writeShellScriptBin "wg-swarm" ''
#           # set -euxo pipefile
#           set -x

#           regex="$1"
#           fwmark=51820
#           table=51820
#           limit=16

#           IP=${pkgs.iproute2}/bin/ip
#           WG=${pkgs.wireguard-tools}/bin/wg

#           NETWORKCTL=${pkgs.systemd}/bin/networkctl
#           RG=${pkgs.ripgrep}/bin/rg
#           AWK=${pkgs.gawk}/bin/awk

#           interfaces="$($NETWORKCTL list | $RG "$regex" | $AWK '{print $2}')"

#           SHUF=${pkgs.coreutils}/bin/shuf
#           HEAD=${pkgs.coreutils}/bin/head
#           SED=${pkgs.gnused}/bin/sed
#           TR=${pkgs.coreutils}/bin/tr

#           swarm="$(echo "$interfaces" | $SHUF | $HEAD -n $limit)"
#           swarm_hops=$(echo "$swarm" | $SED -e 's@^@nexthop dev @' -e 's@$@ weight 1@' | $TR '\n' ' ')

#           WG=${pkgs.wireguard-tools}/bin/wg
#           IP=${pkgs.iproute2}/bin/ip

#           printf "Configuring Wireguard Interfaces\n"
#           printf "fwmark: %s\n" "$fwmark"
#           printf "table: %s\n" "$table"

#           printf "Flushing table %s\n" "$table"
#           $IP route flush table $table
#           $IP rule flush table $table

#           printf "Setting fwmark %s for interfaces\n" "$fwmark"
#           for i in $interfaces;
#           do
#             $IP link set $i up
#             $WG set $i fwmark $fwmark
#           done

#           printf "Setting rules and routes in table %s\n" "$table"
#           $IP rule add not fwmark $fwmark table $table
#           # $IP rule add not to 192.168.0.0/24 table $table
#           $IP route add default table $table ''${swarm_hops[@]}
#           # $IP route add :: table $table ''${swarm_hops[@]}
#           # $IP route add 0.0.0.0 table $table ''${swarm_hops[@]}

#           $IP -6 rule add not fwmark $fwmark table $table
#           $IP -6 route add default table $table ''${swarm_hops[@]}
#         '';

#         wg_netdevs = map ({ interface-name, ... }@wg:
#           lib.nameValuePair "10-${interface-name}" (windscribe-wireguard-netdev wg))
#           windscribe-wireguard-configurations;
#         wg_networks = map ({ interface-name, ... }@wg:
#           lib.nameValuePair interface-name (windscribe-windscribe-network wg))
#           windscribe-wireguard-configurations;
#         wg_interfaces = map ({ interface-name, ... }: interface-name) windscribe-wireguard-configurations;
#       in {
#         environment.systemPackages = [ wg-swarm pkgs.wireguard-tools ];
#         systemd.network.netdevs = lib.listToAttrs wg_netdevs;
#         systemd.network.networks = lib.listToAttrs wg_networks;

#         # Prevent networkd from clearing the rules set by wg-quick when restarted (e.g. when waking up from suspend).
#         # systemd.network.config.networkConfig.ManageForeignRoutingPolicyRules = false;

#         # WireGuard interfaces should be ignored in determining whether the network is online.
#         systemd.network.wait-online.ignoredInterfaces = wg_interfaces;
#       })

      # { environment.variables.NIXOS_OZONE_WL = "1"; }

      { environment.systemPackages = [ pkgs.android-tools ]; }

      # { boot.kernel.sysctl."kernel.task_delayacct" = lib.mkDefault "1"; }

      {
        boot.kernelParams = [
          # "pci=assign-busses,hpbussize=0x10,hpmmiosize=32M,hpmmioprefsize=512M,nocrs,realloc"
        ];
      }

      # {
      #   hardware.nvidia.package = lib.mkOverride (-1000001) config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
      # }

      {
        programs.sniffnet.enable = true;
        environment.systemPackages = [ pkgs.sniffnet ];
      }

      # {
      #   users.users.jupyter.group = "jupyter";
      #   users.groups.jupyter = {};

      #   services.jupyter.enable = true;
      #   services.jupyter.password = "";
      #   services.jupyter.notebookConfig = ''
      #     c.IdentityProvider.token = ""
      #   '';

      #   services.jupyter.package = pkgs.python3.pkgs.jupyterlab;
      #   services.jupyter.command = "jupyter-lab";
      #   services.jupyter.notebookDir = "/home";
      # }

      {
        documentation.enable = false;
        documentation.info.enable = false;
      }

      { environment.sessionVariables.LD_LIBRARY_PATH = [ "${pkgs.stdenv.cc.cc.lib}/lib" ]; }

      # {
      #   boot.kernelModules = lib.mkBefore [ "vfio_pci" ];
      #   boot.kernelParams = [
      #     # PCI Bridge needs to be connected to host
      #     # 3080 ti
      #     # echo '10de 2208' | sudo tee /sys/bus/pci/drivers/vfio-pci/new_id
      #     # 3080 ti audio apparently can be automatically unbinded
      #     # echo '10de 1aef' | sudo tee /sys/bus/pci/drivers/vfio-pci/new_id
      #     "vfio-pci.ids=10de:2208,10de:1aef"
      #   ];
      # }

      { environment.systemPackages = with pkgs; [ efitools ]; }

      {
        environment.sessionVariables.LD_LIBRARY_PATH = [
          "/run/current-system/sw/lib"
          "/run/opengl-driver/lib"
        ];
        environment.systemPackages = with pkgs; [
          glslang
          vulkan-headers vulkan-loader vulkan-validation-layers vulkan-tools
        ];
      }

      { boot.bootspec.enable = true; environment.systemPackages = [ pkgs.sbctl ]; }
      # flakes.lanzaboote.nixosModules.lanzaboote
      # {
      #   boot.loader.systemd-boot.enable = lib.mkForce false;
      #   boot.lanzaboote = {
      #     enable = true;
      #     pkiBundle = "/persist/etc/secureboot";
      #   };
      # }

      { environment.systemPackages = [ pkgs.swtpm ]; }

      {
        # "default_hugepagesz=2M"
        boot.kernelParams = [ "transparent_hugepage=madvise" ];
        boot.kernel.sysfs.sys.kernel.mm.transparent_hugepage.enabled = "madvise";
        boot.kernel.sysfs.sys.kernel.mm.transparent_hugepage.defrag = "madvise"; # "defer+madvise"
        # There is a sysfs file which you can also use to control system wide THP configuration for all tmpfs mounts
        boot.kernel.sysfs.sys.kernel.mm.transparent_hugepage.shmem_enabled = "within_size"; # advise
        fileSystems."/".options = [ "huge=within_size" ]; # advise
        boot.tmp.extraOptions = [ "huge=within_size" ];

        # boot.kernel.sysctl."vm.nr_hugepages" = 512 * 16 * 2; # 2M page
        # fileSystems."/hugepages" =
        #   {
        #     device = "none";
        #     fsType = "hugetlbfs";
        #     options = [ "mode=1777" ];
        #   };
      }

      {
        services.udev.extraRules = ''
          # tpm devices can only be accessed by the tss user but the tss
          # group members can access tpmrm devices
          KERNEL=="tpm[0-9]*", TAG+="systemd", MODE="0660", OWNER="tss", GROUP="tss"
          KERNEL=="tpmrm[0-9]*", TAG+="systemd", MODE="0660", GROUP="tss"
        '';

        users.users.tss = { isSystemUser = true; group = "tss"; };
        users.groups.tss = {};
      }

#       {
#         # virtualisation.docker.enable = true;
#         # virtualisation.containerd = {
#         #   enable = true;
#         #   settings =
#         #     let
#         #       fullCNIPlugins = pkgs.buildEnv {
#         #         name = "full-cni";
#         #         paths = with pkgs;[
#         #           cni-plugins
#         #           cni-plugin-flannel
#         #         ];
#         #       };
#         #     in {
#         #       plugins."io.containerd.grpc.v1.cri".cni = {
#         #         bin_dir = "${fullCNIPlugins}/bin";
#         #         conf_dir = "/var/lib/rancher/k3s/agent/etc/cni/net.d/";
#         #       };
#         #     };
#         # };

# /*
#         nixpkgs.overlays = [ (final: prev: {

#           nvidia-k3s = with final.pkgs; mkNvidiaContainerPkg {
#             name = "nvidia-k3s";
#             containerRuntimePath = "runc";
#             configTemplate = ../architect/etc/nvidia-container-runtime/config.toml;
#           };

#           libnvidia-container = prev.libnvidia-container.overrideAttrs (oldAttrs: {
#             version = flakes.libnvidia-container.version;
#             src = flakes.libnvidia-container.path;

#             patches = [
#               ./libnvidia-container.patch
#               ../architect/libnvidia-container-ldcache.patch
#               (flakes.nixpkgs.path + "/pkgs/applications/virtualization/libnvidia-container/inline-c-struct.patch")
#             ];

#             postPatch = (oldAttrs.postPatch or "") + ''
#               sed -i "s@/etc/ld.so.cache@/tmp/ld.so.cache@" src/common.h
#             '';
#           });

#           nvidia-container-toolkit = prev.nvidia-container-toolkit.overrideAttrs (oldAttrs: {
#             version = flakes.nvidia-container-toolkit.version;
#             src = flakes.nvidia-container-toolkit.path;

#             postPatch = (oldAttrs.postPatch or "") + ''
#               sed -i "s@/etc/ld.so.cache@/tmp/ld.so.cache@" internal/ldcache/ldcache.go
#             '';
#           });
#         }) ];
# */

#         # https://docs.k3s.io/installation/requirements#networking

#         # Typically, all outbound traffic is allowed.
#         # https://github.com/k3s-io/k3s/issues/7211
#         networking.firewall.trustedInterfaces = [ "cni+" ];
#         # networking.firewall.trustedInterfaces = [ "cni+" "flannel+" "veth+" ];

#         services.k3s.enable = true;
#         services.k3s.role = "server"; # or "agent"
#         # services.k3s.serverAddr = ""; # join HA cluster
#         # services.k3s.clusterInit = true; # initialize HA cluster
#         # services.k3s.token = "k3s"; # agent
#         # services.k3s.disableAgent = true;
#         services.k3s.extraFlags = lib.concatStringsSep " " [
#           "--write-kubeconfig-mode=644"
#           "--cluster-cidr=10.42.0.0/16,2001:cafe:42:0::/56"
#           "--service-cidr=10.43.0.0/16,2001:cafe:42:1::/112"
#           "--flannel-backend=wireguard-native"
#           "--disable=traefik"
#           # "--disable-network-policy"
#           # "--disable-helm-controller"
#           # Configure k3s for lazy pulling of eStargz
#           # "--snapshotter=stargz"
#         ];

#         environment.variables.KUBECONFIG = "/etc/rancher/k3s/k3s.yaml";
#         programs.zsh.shellAliases.kubectl = "k3s kubectl";

#         systemd.services.k3s.after = lib.mkForce [];
#         systemd.services.k3s.wants = lib.mkForce [];
#         systemd.services.k3s.serviceConfig.KillMode = lib.mkForce "control-group";
#         systemd.services.k3s.path = with pkgs; [
#           glibc
#           # NVIDIA Container Support
#           # nvidia-k3s
# /*
#           # Expose NVIDIA binaries to PATH
#           (config.hardware.nvidia.package.overrideAttrs (oldAttrs:
#             {
#               builder = ./nvidia-builder.sh;
#             }))
# */
#         ];
#         systemd.services.k3s.serviceConfig.PrivateTmp = true;
# /*
#         systemd.services.k3s.preStart = let
#         in ''
#           # ldconfig wants to generate symlinks
#           rm -rf /tmp/nvidia-libs
#           mkdir -p /tmp/nvidia-libs
#           for thing in ${config.hardware.nvidia.package.overrideAttrs (oldAttrs: {
#             builder = ./nvidia-builder.sh;
#           })}/lib/*;
#           do
#             ln -s $(readlink -f $thing) /tmp/nvidia-libs/$(basename $thing)
#           done

#           echo "Initializing cache with directory"
#           ldconfig -C /tmp/ld.so.cache /tmp/nvidia-libs

#           echo "Printing ld cache contents"
#           ldconfig -C /tmp/ld.so.cache --print-cache
#         '';
# */

#         systemd.services.k3s-proxy = {
#           after = [ "k3s.service" ];
#           wants = [ "k3s.service" ];
#           partOf = [ "k3s.service" ];
#           wantedBy = [ "default.target" ];

#           description = "Kubernetes Proxy";

#           serviceConfig.ExecStart = "${pkgs.k3s}/bin/k3s kubectl proxy --address='127.0.0.1' --api-prefix='/' --port=8001";
#         };
#       }

      {
        services.chrony.enable = true;
        # Needs DNS resolution
        systemd.services.chronyd.wants = [ "network-online.target" ];
        systemd.services.chronyd.after = [ "network-online.target" "nss-lookup.target" ];
      }
    ];

  services.resolved.fallbackDns = lib.mkForce [
    "2606:4700:4700::1111#cloudflare-dns.com"
    "2606:4700:4700::1001#cloudflare-dns.com"
    "1.1.1.1#cloudflare-dns.com"
    "1.0.0.1#cloudflare-dns.com"
    # # ...
    # "8.8.8.8#dns.google"
    # "8.8.4.4#dns.google"
    # "2001:4860:4860::8888#dns.google"
    # "2001:4860:4860::8844#dns.google"
  ];

  # services.resolved.fallbackDns = lib.mkForce config.networking.nameservers;
  # networking.nameservers = [ "::1" "127.0.0.1" ];

  security.lockKernelModules = false;

  programs.hyprland.enable = true;
  # programs.hyprland.xwayland.enable = true;
  # programs.hyprland.xwayland.hidpi = true;
  # programs.hyprland.nvidiaPatches = true;

  services.fwupd.enable = true;
  environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";
  hardware.nvidia.prime.intelBusId = "PCI:0:2:0";
  hardware.nvidia.prime.nvidiaBusId = "PCI:127:0:0"; # "PCI:7f:0:0";

  nix.settings.max-jobs = 6; # 12;

  # zramSwap = {
  #  enable = true;
  #  swapDevices = 1;
  #  memoryPercent = 40;
  #  memoryMax = 8589934592; # 8G
  #  priority = 100;
  #  algorithm = "zstd";
  # };

  # services.kresd.instances = 2;
  services.kresd.listenPlain = lib.mkForce [ "[::1]:53" "127.0.0.1:53" ];
  services.kresd.listenTLS = lib.mkForce [ "[::1]:853" "127.0.0.1:853" ];
  services.kresd.listenDoH = lib.mkForce [ "[::1]:443" "127.0.0.1:443" ];
  services.kresd.extraConfig = lib.mkAfter ''
    -- Log failed DNSSEC queries
    modules.load('bogus_log')

    -- Log all DNS queries
    modules.load('nsid')
    -- -- nsid.name('instance 1')

    -- Internal DNS Query for Resolver Health Check
    -- https://knot-resolver.readthedocs.io/en/stable/modules-watchdog.html
    -- watchdog.config({ qname = 'nic.cz.', qtype = kres.type.A })
  '';

  programs.fuse.userAllowOther = true;

  environment.systemPackages =
    with pkgs;
    [
      st

      nvme-cli

      # Imperial
      # imperial
      bindfs
      mergerfs mergerfs-tools
      unionfs-fuse fuse-overlayfs

      # androidStudioPackages.stable
      # androidStudioPackages.beta
      # androidStudioPackages.canary
      # androidStudioPackages.dev

      mono
      # dotnetCorePackages.sdk_7_0
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
      # terraform

      # nvidia-k3s
    ];

  # boot.plymouth.enable = true;

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

  # environment.etc."systemd/stalld.conf".source = pkgs.stalld + "/etc/systemd/stalld.conf";
  # systemd.services."stalld" = {
  #   wantedBy = [ "multi-user.target" ];

  #   description = "Stall Monitor";

  #   serviceConfig = {
  #     Type = "forking";
  #     EnvironmentFile = "/etc/systemd/stalld.conf";
  #     ExecStart = "${pkgs.stalld}/bin/stalld $CLIST $AGGR $BP $BR $BD $THRESH $LOGGING $FG $PF";
  #   };
  # };

  # specialisation.wireguard = {
  #   inheritParentConfig = true;
  #   configuration.imports = [ ../../modules/network/wireguard.nix ];
  # };

  # specialisation.openvpn = {
  #   inheritParentConfig = true;
  #   configuration.imports = [ ../../modules/network/openvpn.nix ];
  # };

  networking.firewall.allowPing = false;

  /*
  boot.kernelModules = [ "zram" ];
  services.udev.extraRules = ''
    KERNEL=="zram0", SUBSYSTEM=="block", DRIVER=="", ACTION=="add", ATTR{disksize}=="0", ATTR{comp_algorithm}="zstd", ATTR{disksize}="16384M", RUN="${pkgs.util-linux}/sbin/mkswap /dev/zram0"
  '';
  swapDevices = [
    { device = "/dev/zram0"; priority = 5; }
  ];
  */

  environment.memoryAllocator.provider = "libc";

  environment.persistence."/persist" = {
    directories = [
      { directory = "/etc/secureboot"; mode = "0755"; user = "root"; group = "root"; }
      { directory = "/var/lib/victoriametrics"; mode = "0733"; user = "victoriametrics"; group = "victoriametrics"; }
    ];
    files = [ ];
  };
  environment.persistence."/persist".users."${settings.system.user}" = {
    directories = [
      { directory = ".config/discordcanary"; mode = "0700"; }
      { directory = ".config/vivaldi-snapshot"; mode = "0700"; }
      # "f /persist/home/.config/cachix/cachix.dhall 0600 - users -"
      # { directory = ".config/cachix"; mode = "0700"; }
      # "f /persist/home/.config/Yubico/u2f_keys     0644 - users -"
      # { directory = ".config/Yubico"; mode = "0700"; }
      { directory = ".gnupg"; mode = "0700"; }
      # "d /persist/home/.local/share/JetBrains 2770 - users -"
      # { directory = ".local/share/Jetbrains"; mode = "0700"; }
      # "f /persist/home/.local/share/buku/bookmarks.db 0644 - users -"
      # { directory = ".local/share/buku"; mode = "0700"; }
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
  environment.persistence."/cache" = {
    directories = [
      { directory = "/var/lib/alsa"; mode = "0755"; user = "root"; group = "root"; }
      { directory = "/var/lib/bluetooth"; mode = "0755"; user = "root"; group = "root"; }
      # { directory = "/var/lib/iwd"; mode = "0700"; user = "root"; group = "root"; }

      # K3S
      { directory = "/var/lib/cni"; mode = "0700"; user = "root"; group = "root"; }
      { directory = "/var/lib/kubelet"; mode = "0750"; user = "root"; group = "root"; }
      { directory = "/var/lib/rancher"; mode = "0755"; user = "root"; group = "root"; }
    ];
    files = [ ];
  };
  environment.persistence."/cache".users."${settings.system.user}" = {
    directories = [
      { directory = ".cargo"; mode = "0700"; }
      { directory = ".cache/huggingface"; mode = "0700"; }
      { directory = ".cache/nix-index"; mode = "0700"; }
      { directory = ".cache/pypoetry"; mode = "0700"; }
      { directory = ".local/lib/vivaldi-snapshot"; mode = "0700"; }
      # TODO: Needed for home-manager, should probably be tmpfs without any risk of breakage though
      { directory = ".local/state/nix/profiles"; mode = "0700"; }
    ];

    files = [
      { file = ".config/pavucontrol.ini"; parentDirectory.mode = "0700"; }
      { file = ".cache/rofi3.druncache"; parentDirectory.mode = "0700"; }

      { file = ".wakatime.cfg"; }
      { file = ".zsh_history"; }
    ];
  };

  # systemd.tmpfiles.rules = [
  #   "d /persist                    0755 root root  -"
  #   "d /persist/home               2770 root users -"
  # ];

  boot.kernelParams = [
    # General responsivity enhancement
    # "threadirqs"
    # "rcu_nocbs=0-11"

    ## https://rigtorp.se/low-latency-guide/
    # "isolcpus=nohz,domain,0-1" "transparent_hugepage=never"
  ];

  # environment.variables.QT_AUTO_SCREEN_SCALE_FACTOR = toString settings.xserver.dpiScale;

  fonts.fontconfig.antialias = true;

  console = {
    font = "ter-u28n";
    packages = [ pkgs.terminus_font ];
  };

  nixos.settings = {
    system.user = "framework";
    machine.hostname = "compage";
    machine.screen.width = 2256;
    machine.screen.height = 2160;

    machine.cpu.tdp = {
      p1.watts = 24; # 28
      p1.duration = 28.0;
      p2.watts = 64;
      p2.duration = 0.00244140625;
    };

    machine.cpu.undervolt = rec {
      core = 0;
      gpu = 0;
      cache = core;
      uncore = core;
      analogio = core;
    };

    xserver = {
      dpi = 120;  # 96 * dpiScale
      dpiScale = 1;
      # iccProfile = ../../hardware/display/9570/FNVDR-LQ156D1.icc;
    };
  };

  programs.zsh.interactiveShellInit = ''
    bios-upgrade () {
      ${pkgs.fwupd}/bin/fwupdmgr get-devices
      ${pkgs.fwupd}/bin/fwupdmgr get-updates
      ${pkgs.fwupd}/bin/fwupdmgr update
    }
  '';

  security.allowSimultaneousMultithreading = true;

  services = {
    # kresd.instances = 2;

    xserver = {
      extraConfig = ''
        Section "InputClass"
          Identifier "SynPS/2 Synaptics TouchPad"
          MatchProduct "SynPS/2 Synaptics TouchPad"
          MatchIsTouchpad "on"
          MatchOS "Linux"
          MatchDevicePath "/dev/input/event*"
          Option "Ignore" "on"
        EndSection
      '';

      libinput.touchpad.additionalOptions = ''
        Option "AccelSpeed" "1"
      '';
    };
  };
}
