self: super: let
  subOverlays = let
    lib = super.stdenv.lib;
  in builtins.listToAttrs (lib.flatten (map
    (filename: lib.mapAttrsToList
      (n: v: lib.nameValuePair n v)
      (import (./. + "/pkgs/${filename}") self super))
    (builtins.attrNames (builtins.readDir ./pkgs))));
in with self.pkgs; subOverlays // {
  ark = super.ark.override {
    unfreeEnableUnrar = true;
  };

  boxpub = (import (builtins.fetchGit {
    url = "https://git.sr.ht/~eadwu/boxpub";
    ref = "master";
  }) { }).boxpub;

  capitaine-cursors = super.capitaine-cursors.overrideAttrs (oldAttrs: rec {
    version = "master";

    src = builtins.fetchGit {
      url = "https://github.com/keeferrourke/capitaine-cursors";
      ref = version;
    };
  });

  clight = super.clight.overrideAttrs (oldAttrs: rec {
    version = "master";

    src = builtins.fetchGit {
      url = "https://github.com/FedeDP/Clight";
      ref = version;
    };
  });

  clightd = super.clightd.overrideAttrs (oldAttrs: rec {
    version = "master";

    src = builtins.fetchGit {
      url = "https://github.com/FedeDP/Clightd";
      ref = version;
    };
  });

  discord = super.discord-canary.overrideAttrs (oldAttrs: rec {
    pname = "discord";
    version = "canary";

    src = builtins.fetchurl {
      name = "${pname}-${version}.tar.gz";
      url = "https://discordapp.com/api/download/canary?platform=linux&format=tar.gz";
    };
  });

  glava = super.glava.override {
    enableGlfw = true;
  };

  i3lock-color = super.i3lock-color.overrideAttrs (oldAttrs: {
    postPatch = (oldAttrs.postPatch or "") + ''
      # i3lock-color: drop unconditional asan
      sed -i -e 's#default_sanitizers=address#default_sanitizers=#' configure.ac
    '';
  });

  knot-resolver = super.knot-resolver.override {
    extraFeatures = true;
  };

  lightdm-enso-os-greeter = super.lightdm-enso-os-greeter.overrideAttrs (oldAttrs: rec {
    name = "${pname}-${version}";
    pname = "lightdm-enso-os-greeter";
    version = "master";

    src = builtins.fetchGit {
      url = "https://github.com/nick92/Enso-OS";
      ref = version;
    };
  });

  ncmpcpp = super.ncmpcpp.override {
    clockSupport = true;
    outputsSupport = true;
    visualizerSupport = true;
  };

  dmenu = super.dmenu.overrideAttrs (oldAttrs: rec {
    name = "${pname}-${version}";
    pname = "dmenu";
    version = "develop";

    src = builtins.fetchGit {
      url = "https://gitlab.com/eadwu/dmenu";
      ref = version;
    };
  });

  dwm = super.dwm.overrideAttrs (oldAttrs: rec {
    name = "${pname}-${version}";
    pname = "dwm";
    version = "develop";

    src = builtins.fetchGit {
      url = "https://gitlab.com/eadwu/dwm";
      ref = version;
    };
  });

  st = super.st.overrideAttrs (oldAttrs: rec {
    name = "${pname}-${version}";
    pname = "st";
    version = "develop";

    src = builtins.fetchGit {
      url = "https://gitlab.com/eadwu/st";
      ref = version;
    };
  });

  vaapiIntel = super.vaapiIntel.override {
    enableHybridCodec = true;
  };
}
