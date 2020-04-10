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
          (builtins.attrNames (lib.filterAttrs (_: v: v == "regular") (builtins.readDir ./pkgs)))
      )
    );
in
  with self.pkgs; subOverlays // {
    ark = super.ark.override {
      unfreeEnableUnrar = true;
    };

    glava = super.glava.override {
      enableGlfw = true;
    };

    knot-resolver = super.knot-resolver.override {
      extraFeatures = true;
    };

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

    picom = super.picom.overrideAttrs (_: rec {
      version = "2020-04-01";

      src = fetchFromGitHub {
        owner = "yshui";
        repo = "picom";
        rev = "85086bc9843f408b761580357d4f88b5ea626ada";
        sha256 = "sha256-uI5DSQ/ea4usRkYD/0mIzFrgb5o8RUfoQfhXflFH05w=";
        fetchSubmodules = true;
      };

      patches = [ ../patches/picom/dual_kawase.patch ];
    });

    polybar = super.polybar.override {
      githubSupport = true;
      mpdSupport = true;
      pulseSupport = true;
    };

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
