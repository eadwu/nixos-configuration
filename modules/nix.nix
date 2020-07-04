{ flakes, config, pkgs, lib, ... }:

with config.nixos; {
  nix = {
    autoOptimiseStore = true;
    buildCores = 0;
    distributedBuilds = true;
    package = pkgs.nixFlakes;
    requireSignedBinaryCaches = true;
    useSandbox = true;
    trustedUsers = [ "root" settings.system.user ];
    allowedUsers = [ "@wheel" ];

    binaryCaches = [
      "https://sys.cachix.org/"
      "https://rpi.cachix.org/"
    ];

    binaryCachePublicKeys = [
      "sys.cachix.org-1:KrERagTDZBL9DkZrQb/+loTtpKBats1MxJ/Q+zmCKrg="
      "rpi.cachix.org-1:Rfb3+jN/+LcMvuTkGFkB9uTkRcNUq97AGSFxF1wMPDU="
    ];

    extraOptions = ''
      show-trace = true
      experimental-features = flakes nix-command
    '';

    nixPath =
      [
        "nixpkgs=${flakes.nixpkgs.path}"
        "nixpkgs-overlays=${builtins.toString ../overlays}"
      ];

    registry =
      {
        local = {
          from = { type = "indirect"; id = "local"; };
          to = { type = "github"; owner = "eadwu"; repo = "nixpkgs"; ref = "develop"; };
        };

        custom = {
          from = { type = "indirect"; id = "custom"; };
          to = { type = "github"; owner = "eadwu"; repo = "flakes"; };
        };
      };
  };

  nixpkgs = {
    overlays = [
      (
        final: prev: {
          tlp = prev.tlp.override {
            inherit (config.boot.kernelPackages) x86_energy_perf_policy;
          };

          nix-index = prev.nix-index.override {
            nix = config.nix.package;
          };

          nix-prefetch-scripts = prev.nix-prefetch-scripts.override {
            nix = config.nix.package;
          };

          nixos-option = prev.nixos-option.override {
            nix = config.nix.package;
          };
        }
      )
    ] ++ map
      (p: import (../overlays + "/${p}"))
      (builtins.attrNames (lib.filterAttrs (_: v: v == "regular") (builtins.readDir ../overlays)));

    config = {
      allowUnfree = true;
    };
  };
}
