{ config, pkgs, lib, ... }:

let
  pipewire-libs = pkgs.runCommand "pipewire-libs" {} ''
    mkdir -p $out/lib

    ${pkgs.xlibs.lndir}/bin/lndir ${pkgs.pipewire.lib}/lib $out/lib
    ${pkgs.xlibs.lndir}/bin/lndir ${pkgs.pipewire.jack}/lib $out/lib
    ${pkgs.xlibs.lndir}/bin/lndir ${pkgs.pipewire.pulse}/lib $out/lib

    for lib in $out/lib/lib{pulse,jack}*.so.0; do
      ln -s $lib $lib.999.0
    done
  '';

  toPipewireConf =
    { property ? {},
      spa-lib ? {},
      module ? {},
      object ? {},
      exec ? pkgs.pipewire + "/bin/pipewire-media-session" }:
    with lib;
    ''
      ${concatStringsSep "\n" (mapAttrsToList
        (n: v: "set-prop ${n} ${toString v}")
        property)}

      ${concatStringsSep "\n" (mapAttrsToList
        (n: v: "add-spa-lib ${n} ${toString v}")
        spa-lib)}

      ${concatMapStringsSep "\n" (def: def.value) (sortProperties (mapAttrsToList
        (n: v:
          let
            ifExists = if v ? ifExists && v.ifExists then "-ifexists" else "";
            args = concatStringsSep " " (mapAttrsToList
              (n: v: "${n}=${toString v}")
              (v.args or {}));
          in { value = lib.mkOrder (v._priority or 100) "load-module${ifExists} libpipewire-module-${n} ${args}"; })
        module))}

      ${concatStringsSep "\n" (mapAttrsToList
        (n: arr: concatMapStringsSep "\n"
          (v:
            let
              noFail = if v ? noFail && v.noFail then "-nofail" else "";
              args = concatStringsSep " " (mapAttrsToList
                (n: v: "${n}=${toString v}")
                (v.args or {}));
            in "create-object${noFail} ${n} ${args}")
          arr)
        object)}

      exec ${exec}
    '';
in
{
  sound.enable = true;
  security.rtkit.enable = true;
  hardware.bluetooth.hsphfpd.enable = true;

  boot.kernelModules = [ "snd_seq" "snd_seq_midi" ];

  services.pipewire.enable = true;
  # services.pipewire.alsa.enable = true; # custom alsa setup anyway
  environment.systemPackages = [ (lib.hiPrio pipewire-libs) ]
    ++ [ pkgs.pulseaudioLight pkgs.pavucontrol ] # for pactl usage and finer output control
    ++ [ pkgs.calf ] # equalizer plugin
    ;
  environment.sessionVariables.LD_LIBRARY_PATH = [ (pipewire-libs + "/lib") ]; # DL injection compatibility
  environment.sessionVariables.PIPEWIRE_PROPS = [ "media.class=Audio/Sink" ]; # Compatibility with Jack to use Calf for equalizer
  environment.etc."asound.conf".text = lib.mkForce ''
    defaults.pcm.rate_converter "speexrate_best"
    defaults.pcm.libs.speex = ${pkgs.alsaPlugins}/lib/alsa-lib/libasound_module_rate_speexrate_best.so ;

    <${pkgs.pipewire}/share/alsa/alsa.conf.d/50-pipewire.conf>
    pcm_type.pipewire {
      libs.native = ${pkgs.pipewire.lib}/lib/alsa-lib/libasound_module_pcm_pipewire.so ;
    }
    ctl_type.pipewire {
      libs.native = ${pkgs.pipewire.lib}/lib/alsa-lib/libasound_module_ctl_pipewire.so ;
    }
    <${pkgs.pipewire}/share/alsa/alsa.conf.d/99-pipewire-default.conf>

    ${config.sound.extraConfig}
  '';

  # See the following for intelligent configuration adjustments
  #   https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/289#note_624581
  #   https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/221#note_445037
  systemd.user.services.pipewire.environment."PIPEWIRE_CONFIG_FILE" = pkgs.writeText "pipewire.conf" (toPipewireConf {
    property = {
      ## set-prop is used to configure properties in the system
      #
      "library.name.system" = "support/libspa-support";
      "context.data-loop.library.name.system" = "support/libspa-support";
      "link.max-buffers" = 64;
      "mem.allow-mlock" = true;
      # "log.level" = 2;

      ## Properties for the DSP configuration
      #
      "default.clock.rate" = 48000;
      "default.clock.quantum" = 384;
      "default.clock.min-quantum" = 12;
      "default.clock.max-quantum" = 6144;
      # "default.video.width" = 640;
      # "default.video.height" = 480;
      # "default.video.rate.num" = 25;
      # "default.video.rate.denom" = 1;

      "default.resample.quality" = 9;
    };

    spa-lib = {
      ## add-spa-lib <factory-name regex> <library-name>
      #
      # used to find spa factory names. It maps an spa factory name
      # regular expression to a library name that should contain
      # that factory.
      #
      "audio.convert*" = "audioconvert/libspa-audioconvert";
      "api.alsa.*" = "alsa/libspa-alsa";
      "api.v4l2.*" = "v4l2/libspa-v4l2";
      "api.libcamera.*" = "libcamera/libspa-libcamera";
      "api.bluez5.*" = "bluez5/libspa-bluez5";
      "api.vulkan.*" = "vulkan/libspa-vulkan";
      "api.jack.*" = "jack/libspa-jack";
      "support.*" = "support/libspa-support";
      # "videotestsrc" = "videotestsrc/libspa-videotestsrc";
      # "audiotestsrc" = "audiotestsrc/libspa-audiotestsrc";
    };

    module = {
      ## load-module [-ifexists] <module-name> [<key>=<value> ...]
      #
      # Loads a module with the given parameters. Normally failure is
      # fatal if the module is not found, unless -ifexists is given.
      #
      rtkit = {
        # args = {
        #   "rt.prio" = 20;
        #   "rt.time.soft" = 200000;
        #   "rt.time.hard" = 200000;
        # };
      };
      protocol-native = { _priority = -100; };
      profiler = {};
      metadata = {};
      spa-device-factory = {};
      spa-node-factory = {};
      client-node = {};
      client-device = {};
      portal = {};
      access = {
        # args = {
        #   "access.allowed" = pkgs.pipewire + "/bin/pipewire-media-session";
        #   "access.force" = "flatpak";
        # };
      };
      adapter = {};
      link-factory = {};
      session-manager = {};
    };

    object = {
      ## create-object [-nofail] <factory-name> [<key>=<value> ...]
      #
      # Creates an object from a PipeWire factory with the given parameters.
      # If -nofail is given, errors are ignored (and no object is created)
      #
      spa-node-factory = [
        # {
        #   args = {
        #     "factory.name" = "videotestsrc";
        #     "node.name" = "videotestsrc";
        #     "Spa:Pod:Object:Param:Props:patternType" = 1;
        #   };
        # }

        # {
        #   args = {
        #     "factory.name" = "api.vulkan.compute.source";
        #     "node.name" = "my-compute-source";
        #   };
        # }

        {
          args = {
            "factory.name" = "support.node.driver";
            "node.name" = "Dummy";
            "priority.driver" = 8000;
          };
        }
      ];

      # spa-device-factory = [
      #   {
      #     noFail = true;
      #     args = {
      #       "factory.name" = "api.jack.device";
      #       foo = "bar";
      #     };
      #   }

      #   {
      #     args = {
      #       "factory.name" = "api.alsa.enum.udev";
      #     };
      #   }

      #   {
      #     args = {
      #       "factory.name" = "api.alsa.seq.bridge";
      #       "node.name" = "Internal-MIDI-Bridge";
      #     };
      #   }
      # ];

      # adapter = [
      #   {
      #     args = {
      #       "factory.name" = "audiotestsrc";
      #       "node.name" = "my-test";
      #     };
      #   }
      # ];
    };

    ## exec <program-name>
    #
    # Execute the given program. This is usually used to start the
    # session manager. run the session manager with -h for options
    #
    exec = "${pkgs.pipewire}/bin/pipewire-media-session";
  });

  nixpkgs.overlays = [
    (final: prev:
      with final;
      {

        pipewire = (prev.pipewire.override { hsphfpdSupport = true; }).overrideAttrs (oldAttrs:
          rec {
            version = "2020-11-01";

            src = fetchFromGitLab {
              domain = "gitlab.freedesktop.org";
              owner = "pipewire";
              repo = "pipewire";
              rev = "92c541ea0365e72eec17c81e0c50539da8e83ea6";
              sha256 = "04capihvykizrkl3f4wkcc58xqil7rqpda2k31pzjh1bbxbnpzjy";
            };

            patches = [
              (final.pkgs.path + "/pkgs/development/libraries/pipewire/alsa-profiles-use-libdir.patch")
              (final.pkgs.path + "/pkgs/development/libraries/pipewire/installed-tests-path.patch")
            ];

            mesonFlags = (oldAttrs.mesonFlags or [])
              ++ [
                "-Dvolume=true"
              ];
          });

        cpptoml = stdenv.mkDerivation
          rec {
            pname = "cpptoml";
            version = "0.1.1";

            src = fetchFromGitHub {
              owner = "skystrife";
              repo = "cpptoml";
              rev = "v${version}";
              sha256 = "0zlgdlk9nsskmr8xc2ajm6mn1x5wz82ssx9w88s02icz71mcihrx";
            };

            nativeBuildInputs = [ cmake pkgconfig ];
          };

        wireplumber = prev.wireplumber.overrideAttrs (oldAttrs:
          rec {
            version = "2020-10-22";

            src = fetchFromGitLab {
              domain = "gitlab.freedesktop.org";
              owner = "pipewire";
              repo = "wireplumber";
              rev = "bc17aaa39771a4badd4c47c4c7441a4ba47af9be";
              sha256 = "173diph581fx5zniddsy92vkl1rpk7jbhlds6sai06mxm564n2av";
            };

            buildInputs = (oldAttrs.buildInputs or []) ++ [ cpptoml ];
            mesonFlags = (oldAttrs.mesonFlags or []) ++ [ "-Dwrap_mode=nodownload" ];
          });

      })
  ];
}
