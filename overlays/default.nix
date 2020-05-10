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
