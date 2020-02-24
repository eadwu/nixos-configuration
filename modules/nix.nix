{ config, pkgs, lib, ... }:

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
      "https://config.cachix.org/"
      "https://all-hies.cachix.org/"
      "https://boxpub.cachix.org/"
      "https://rpi.cachix.org/"
    ];

    binaryCachePublicKeys = [
      "config.cachix.org-1:dR/yvjsRz8TWkZj5mKcTckVTpHWCy9aPiRwGIvhAP9A="
      "all-hies.cachix.org-1:JjrzAOEUsD9ZMt8fdFbzo3jNAyEWlPAwdVuHw4RD43k="
      "boxpub.cachix.org-1:H+WS+f/7uZml+Koio43kDpA7emp6aJ6kAwRS47oX0Zo="
      "rpi.cachix.org-1:Rfb3+jN/+LcMvuTkGFkB9uTkRcNUq97AGSFxF1wMPDU="
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
      # Getting the latest vivaldi snapshot uses IFD
      # allow-import-from-derivation = false
      # Useful when the builder has a faster internet connection than yours
      # builders-use-substitutes = true
    '';

    nixPath = [ "/etc/nixos" ]
    ++ (
      if builtins.pathExists ../../nixpkgs
      then [ "nixpkgs=${builtins.toString ../../nixpkgs}" ]
      else [
        "nixpkgs=https://gitlab.com/eadwu/nixpkgs/-/archive/develop/nixpkgs-develop.tar.gz"
        "nixpkgs=https://api.github.com/repos/eadwu/nixpkgs/tarball/develop"
      ]
    )
    ++ lib.optional (builtins.pathExists ../overlays)
      "nixpkgs-overlays=${builtins.toString ../overlays}";
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
    ] ++ lib.optional (builtins.pathExists <nixpkgs-overlays>) (import <nixpkgs-overlays>);

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

  system = {
    stateVersion = lib.mkDefault "19.03";

    autoUpgrade = {
      enable = false;
      channel = "https://nixos.org/channels/nixpkgs-unstable";
    };
  };
}
