{ flakes, config, pkgs, lib, ... }:

with config.nixos; {
  nix = {
    distributedBuilds = true;
    package = pkgs.nixVersions.latest;

    extraOptions = ''
      show-trace = true
      experimental-features = flakes nix-command ca-derivations
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

    settings =
      {
        sandbox = true;
        trusted-users = [ "root" settings.system.user ];
        require-sigs = true;
        cores = 0;
        auto-optimise-store = true;
        allowed-users = [ "@wheel" ];
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

          # nix-prefetch-scripts = prev.nix-prefetch-scripts.override {
          #   nix = config.nix.package;
          # };

          # nixos-option = prev.nixos-option.override {
          #   nix = config.nix.package;
          # };
        }
      )
    ] ++ map
      (p: import (../overlays + "/${p}"))
      (builtins.attrNames (lib.filterAttrs (_: v: v == "regular") (builtins.readDir ../overlays)));

    config = {
      allowUnfree = true;
      # Fully content-addressed system by default.
      # contentAddressedByDefault = true;
      # Ensures no aliases.  Essentially attempt to keep up with the times.
      allowAliases = false;
    };
  };
}
