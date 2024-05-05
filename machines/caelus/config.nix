{ flakes, options, config, pkgs, lib, modulesPath, ... }:

{
   # Allow compilation of windows executables
  nixpkgs.config.allowUnsupportedSystem = true;

  environment.systemPackages = with pkgs; [
    dnstap
    /*
    (with pkgs.pkgsCross.mingwW64; libressl.overrideAttrs (
      oldAttrs:
      {
        outputs = [ "bin" "dev" "man" "out" ];
        # postInstall = (oldAttrs.postInstall or "") + ''
        #   mkdir -p $bin $dev $man $nc $out
        # '';
      }
    ))
    */
    /*
    (with pkgs.pkgsCross.mingwW64; (socat.overrideAttrs (
      oldAttrs:
      {
        hardeningEnable = [];
        postPatch = (oldAttrs.postPatch or "") + ''
          # Use Windows equivalent
          sed '1i\#include <stdint.h>' xioconfig.h
          sed -i 's@arpa/inet.h@winsock2.h@' sysincludes.h
        '';
      }
    )).override {
      readline = (readline.override {
        ncurses = ncurses.overrideAttrs (
          oldAttrs:
          {
            postInstall = (oldAttrs.postInstall or "") + ''
              mv $dev/bin/*.dll $out/lib/
              cp $out/lib/{libncursesw6,libncurses}.dll
            '';
          }
        );
      }).overrideAttrs (
        oldAttrs:
        {
          patches = [];
          # patches = (oldAttrs.patches or []) ++ (
          #   lib.optionals stdenv.hostPlatform.isWindows [
          #     (flakes.mingw-packages.path + "/mingw-w64-readline/0001-sigwinch.patch")
          #     (flakes.mingw-packages.path + "/mingw-w64-readline/0002-event-hook.patch")
          #     (flakes.mingw-packages.path + "/mingw-w64-readline/0003-fd_set.patch")
          #     (flakes.mingw-packages.path + "/mingw-w64-readline/0004-locale.patch")
          #   ]
          # );

          # Ripped from mingw-w64-readline/PKGBUILD
          postPatch = (oldAttrs.postPatch or "") + (
            lib.optionalString stdenv.hostPlatform.isWindows ''
              for patch in 0001-sigwinch.patch 0002-event-hook.patch 0003-fd_set.patch; do
                echo "applying $patch"
                patch -p1 -i ${flakes.mingw-packages.path}/mingw-w64-readline/$patch
              done

              # Remove RPATH from shared objects (FS#14366)
              sed -i 's|-Wl,-rpath,$(libdir) ||g' support/shobj-conf
              # Fully spell out linker option
              sed -i 's|-Wl,--export-all |-Wl,--export-all-symbols |g' support/shobj-conf

              # Link to ncurses instead of curses
              sed -i 's@BASH_CHECK_LIB_TERMCAP@TERMCAP_LIB=-lncurses@g' configure.ac
            ''
          );

          configureFlags = (oldAttrs.configureFlags or []) ++ [ "--with-curses" ];
        }
      );
    })
    */
    /*
    (stdenv.mkDerivation rec {
      pname = "netcat";
      version = "1.219";

      src = fetchurl {
        url = "https://mirror.msys2.org/msys/x86_64/openbsd-netcat-${version}_1-1-x86_64.pkg.tar.zst";
        sha256 = "sha256-9HnqsxkLco7+Wo038J1gvPf0T+nmL0ZgQhGkJ/phgNc=";
      };

      dontBuild = true;
      nativeBuildInputs = [ zstd ];

      installPhase = ''
        mkdir -p $out/bin
        cp bin/* $out/bin
      '';

      dontFixup = true;
      dontStrip = true;
    })
    (stdenv.mkDerivation rec {
      pname = "socat";
      version = "1.7.4.4";

      src = fetchurl {
        url = "https://mirror.msys2.org/msys/x86_64/${pname}-${version}-1-x86_64.pkg.tar.zst";
        sha256 = "sha256-JSkpEiF9iA30fgdWXxAGuVlcPZLtA2m9crccqUDNUXY=";
      };

      dontBuild = true;
      nativeBuildInputs = [ zstd ];

      installPhase = ''
        mkdir -p $out/bin
        cp bin/* $out/bin
      '';

      dontFixup = true;
      dontStrip = true;
    })
    */
  ];

  imports =
    [
      ./modules/kresd.nix
    ];

  networking.firewall.allowedTCPPorts = [ 853 ];
  # networking.firewall.allowedTCPPorts = [ 443 853 ];
  networking.firewall.allowedUDPPorts = [ 54 ];

  # services.kresd.instances = 2;
  services.kresd.listenPlain = lib.mkForce [ "0.0.0.0:54" ];
  services.kresd.listenTLS = lib.mkForce [ "[::1]:853" "127.0.0.1:853" ];
  # services.kresd.listenDoH = lib.mkForce [ "[::1]:443" "127.0.0.1:443" ];
  services.kresd.extraConfig = lib.mkAfter ''
    -- Log failed DNSSEC queries
    modules.load('bogus_log')

    -- Log all DNS queries
    modules.load('nsid')
    -- -- nsid.name('instance 1')
    modules.load('dnstap')
    dnstap.config({
      socket_path = '/tmp/dnstap',
      identity = nsid.name() or "",
      version = 'Knot Resolver ' .. package_version(),
      client = {
        log_queries = true,
        log_responses = true,
      },
    })

    -- Internal DNS Query for Resovler Health Check
    -- https://knot-resolver.readthedocs.io/en/stable/modules-watchdog.html
    -- watchdog.config({ qname = 'nic.cz.', qtype = kres.type.A })
  '';

  systemd.services."kresd@".after = [ "dnstap.service" ];
  systemd.services.dnstap = {
    description = "dnstap socket";
    wantedBy = [ "multi-user.target" "kresd@.service" ];

    serviceConfig = {
      # ExecStart = "${pkgs.dnstap}/bin/dnstap -j -u /tmp/dnstap";
      ExecStart = "${pkgs.dnstap}/bin/dnstap -u /tmp/dnstap";
      User = "knot-resolver";
      Group = "knot-resolver";
      Restart = "on-failure";
    };
  };

  systemd.targets.wsl-udp-proxy = {
    wantedBy = [ "default.target" ];
    wants = map ({ hostPort, proxyPort }: "wsl-udp-proxy@${toString hostPort}_${toString proxyPort}.service") ([
      { hostPort = 54; proxyPort = 53; }
    ]);
  };
}
