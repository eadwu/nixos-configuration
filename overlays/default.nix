self: super: let
  rPackages = with super.rPackages; [
    ggplot2
    showtext
    rmarkdown
    RDocumentation
  ];

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

  capitaine-cursors = super.capitaine-cursors.overrideAttrs (oldAttrs: rec {
    version = "master";

    src = builtins.fetchGit {
      url = "https://github.com/keeferrourke/capitaine-cursors";
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

  rWrapper = super.rWrapper.override {
    packages = rPackages;
  };

  rstudioWrapper = super.rstudioWrapper.override {
    packages = rPackages;
  };
}
