final: prev: let
  subOverlays = let
    lib = prev.stdenv.lib;
  in
    builtins.listToAttrs (
      lib.flatten (
        map
          (
            filename: lib.mapAttrsToList
              (n: v: lib.nameValuePair n v)
              (import (./. + "/pkgs/${filename}") final prev)
          )
          (builtins.attrNames (lib.filterAttrs (_: v: v == "regular") (builtins.readDir ./pkgs)))
      )
    );
in
  with final.pkgs; subOverlays // {
    ark = prev.ark.override {
      unfreeEnableUnrar = true;
    };

    glava = prev.glava.override {
      enableGlfw = true;
    };

    knot-resolver = prev.knot-resolver.override {
      extraFeatures = true;
    };

    ncmpcpp = prev.ncmpcpp.override {
      clockSupport = true;
      outputsSupport = true;
      visualizerSupport = true;
    };

    polybar = prev.polybar.override {
      githubSupport = true;
      mpdSupport = true;
      pulseSupport = true;
    };

    typora = prev.typora.override {
      withPandoc = true;
    };

    vaapiIntel = prev.vaapiIntel.override {
      enableHybridCodec = true;
    };

    vim_configurable = prev.vim_configurable.override {
      ftNixSupport = true;
    };
  }
