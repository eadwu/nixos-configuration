self: super: let
  subOverlays = let
    lib = super.stdenv.lib;
  in
    builtins.listToAttrs (
      lib.flatten (
        map
          (
            filename: lib.mapAttrsToList
              (n: v: lib.nameValuePair n v)
              (import (./. + "/pkgs/${filename}") self super)
          )
          (builtins.attrNames (builtins.readDir ./pkgs))
      )
    );
in
  with self.pkgs; subOverlays // {
    ark = super.ark.override {
      unfreeEnableUnrar = true;
    };

    blender = super.blender.override {
      enableNumpy = true;
    };

    boxpub = (
      import (
        builtins.fetchTarball {
          url = "https://git.sr.ht/~eadwu/boxpub/archive/master.tar.gz";
        }
      ) {}
    ).boxpub;

    capitaine-cursors = super.capitaine-cursors.overrideAttrs (
      _: rec {
        version = "master";

        src = builtins.fetchTarball {
          url = "https://github.com/keeferrourke/capitaine-cursors/archive/${version}.tar.gz";
        };
      }
    );

    discord = super.discord-canary.overrideAttrs (
      _: rec {
        pname = "discord";
        version = "canary";

        src = builtins.fetchTarball {
          name = "${pname}-${version}.tar.gz";
          url = "https://discordapp.com/api/download/canary?platform=linux&format=tar.gz";
        };
      }
    );

    dmenu = super.dmenu.overrideAttrs (
      _: rec {
        name = "${pname}-${version}";
        pname = "dmenu";
        version = "develop";

        src = builtins.fetchTarball {
          url = "https://gitlab.com/eadwu/dmenu/-/archive/${version}/${name}.tar.gz";
        };
      }
    );

    dwm = super.dwm.overrideAttrs (
      _: rec {
        name = "${pname}-${version}";
        pname = "dwm";
        version = "develop";

        src = builtins.fetchTarball {
          url = "https://gitlab.com/eadwu/dwm/-/archive/${version}/${name}.tar.gz";
        };
      }
    );

    glava = super.glava.override {
      enableGlfw = true;
    };

    i3lock-color = super.i3lock-color.overrideAttrs (
      oldAttrs: {
        postPatch = (oldAttrs.postPatch or "") + ''
          # i3lock-color: drop unconditional asan
          sed -i -e 's#default_sanitizers=address#default_sanitizers=#' configure.ac
        '';
      }
    );

    knot-resolver = super.knot-resolver.override {
      extraFeatures = true;
    };

    lightdm-enso-os-greeter = super.lightdm-enso-os-greeter.overrideAttrs (
      _: rec {
        name = "${pname}-${version}";
        pname = "lightdm-enso-os-greeter";
        version = "master";

        src = builtins.fetchTarball {
          url = "https://github.com/nick92/Enso-OS/archive/${version}.tar.gz";
        };
      }
    );

    ncmpcpp = super.ncmpcpp.override {
      clockSupport = true;
      outputsSupport = true;
      visualizerSupport = true;
    };

    nixopsUnstable = (
      import (
        "${builtins.fetchTarball {
          url = "https://git.sr.ht/~eadwu/nixops/archive/master.tar.gz";
        }}/release.nix"
      ) { p = p: with p; [ vbox libvirtd ]; }
    ).build.${stdenv.hostPlatform.system};

    polybar = super.polybar.override {
      githubSupport = true;
      mpdSupport = true;
      pulseSupport = true;
    };

    st = super.st.overrideAttrs (
      _: rec {
        name = "${pname}-${version}";
        pname = "st";
        version = "develop";

        src = builtins.fetchTarball {
          url = "https://gitlab.com/eadwu/st/-/archive/${version}/${name}.tar.gz";
        };
      }
    );

    typora = super.typora.override {
      withPandoc = true;
    };

    vaapiIntel = super.vaapiIntel.override {
      enableHybridCodec = true;
    };

    vim_configurable = super.vim_configurable.override {
      ftNixSupport = true;
    };
  }
