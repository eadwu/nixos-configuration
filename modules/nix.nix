{ config, pkgs, lib, ... }:

with config.nixos; {
  nix = {
    autoOptimiseStore = true;
    buildCores = 0;
    distributedBuilds = true;
    package = pkgs.nixUnstable;
    requireSignedBinaryCaches = true;
    useSandbox = true;

    binaryCaches = [
      "https://cache.nixos.org/"
      "https://machine.cachix.org/"
      "https://hie-nix.cachix.org/"
    ];

    binaryCachePublicKeys = [
      "hydra.nixos.org-1:CNHJZBh9K4tP3EKF6FkkgeVYsS3ohTl+oS0Qa8bezVs="
      "machine.cachix.org-1:qztDn4LVyyDQ4gYtIlo/6QUdKAoKXOPG9JMnIi5PEDg="
      "hie-nix.cachix.org-1:EjBSHzF6VmDnzqlldGXbi0RM3HdjfTU3yDRi9Pd0jTY="
    ];

    buildMachines = [
      { hostName = "builder";
        system = "aarch64-linux";
        maxJobs = 3;
        supportedFeatures = [ "kvm" "perf" "nixos-test" "big-parallel" ]; }
    ];

    extraOptions = ''
      show-trace = true
      # useful when the builder has a faster internet connection than yours
      # builders-use-substitutes = true
    '';

    nixPath = lib.singleton "/etc/nixos"
      ++ (if builtins.pathExists ../../nixpkgs
        then lib.singleton "nixpkgs=${builtins.toString ../../nixpkgs}"
        else [
          "nixpkgs=https://gitlab.com/eadwu/nixpkgs/-/archive/develop/nixpkgs-develop.tar.gz"
          "nixpkgs=https://api.github.com/repos/eadwu/nixpkgs/tarball/develop"
        ])
      ++ lib.optional (builtins.pathExists ../overlays)
        "nixpkgs-overlays=${builtins.toString ../overlays}";
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = lib.optional (builtins.pathExists <nixpkgs-overlays>) (import <nixpkgs-overlays>);
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
    stateVersion = "19.09";

    autoUpgrade = {
      enable = false;
      channel = "https://nixos.org/channels/nixpkgs-unstable";
    };
  };
}
