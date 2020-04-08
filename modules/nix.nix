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
      "https://all-hies.cachix.org/"
    ];

    binaryCachePublicKeys = [
      "sys.cachix.org-1:+pkmJFQq2g1Oq/u3bDlcyL4EwYWwlvmFWZpUwMDN3M4="
      "rpi.cachix.org-1:Rfb3+jN/+LcMvuTkGFkB9uTkRcNUq97AGSFxF1wMPDU="
      "all-hies.cachix.org-1:JjrzAOEUsD9ZMt8fdFbzo3jNAyEWlPAwdVuHw4RD43k="
    ];

    buildMachines = [
      {
        hostName = "builder";
        system = "aarch64-linux";
        maxJobs = 2;
        supportedFeatures = [ "benchmark" "big-parallel" "kvm" "nixos-test" ];
      }
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
        self: super: {
          tlp = super.tlp.override {
            inherit (config.boot.kernelPackages) x86_energy_perf_policy;
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

  programs.ssh.extraConfig = ''
    Host builder
      User root
      HostName ${settings.machines.rpi.hostName}

      IdentitiesOnly yes
      IdentityFile ${settings.machines.rpi.identityFile}

      ServerAliveInterval 4
  '';
}
