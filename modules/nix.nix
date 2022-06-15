{ flakes, config, pkgs, lib, ... }:

with config.nixos; {
  nix = {
    distributedBuilds = true;
    package = pkgs.nixVersions.unstable;

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
        substituters = [
          "https://sys.cachix.org/"
          "https://cache.ngi0.nixos.org/"
          "https://nix-community.cachix.org/"
        ];
        trusted-public-keys = [
          "sys.cachix.org-1:KrERagTDZBL9DkZrQb/+loTtpKBats1MxJ/Q+zmCKrg="
          "cache.ngi0.nixos.org-1:KqH5CBLNSyX184S9BKZJo1LxrxJ9ltnY2uAs5c/f1MA="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
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
      # Fully content-addressed system by default.
      # contentAddressedByDefault = true;
      # Ensures no aliases.  Essentially attempt to keep up with the times.
      allowAliases = false;
    };
  };

  /* Prevent Nix from hogging entire system. */
  systemd.services.nix-daemon.serviceConfig.Slice = "user-nixbld.slice";
  systemd.slices.user-nixbld.sliceConfig = {
    # 200 * 12 / config.nix.maxJobs / 2
    CPUWeight = toString (200 * 12 / (config.nix.settings.max-jobs * 2));
    # config.nix.maxJobs / 12 / 2 * 1024
    CPUShares = toString (1024 * config.nix.settings.max-jobs / 24);
  };
}
