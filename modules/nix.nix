{ config, pkgs, lib, ... }:

with config.nixos; {
  nix = {
    autoOptimiseStore = true;
    buildCores = 0;
    package = pkgs.nixUnstable;
    requireSignedBinaryCaches = true;
    useSandbox = true;

    binaryCaches = [ "https://cache.nixos.org/" ];
    binaryCachePublicKeys = [ "hydra.nixos.org-1:CNHJZBh9K4tP3EKF6FkkgeVYsS3ohTl+oS0Qa8bezVs=" ];

    extraOptions = ''
      show-trace = true
    '';

    nixPath = let basePath = builtins.toPath "${settings.system.home}/Downloads"; in [
      "/etc/nixos"
      "nixos-config=/etc/nixos/configuration.nix"
    ]
      ++ (if builtins.pathExists (builtins.toPath "${basePath}/nixpkgs")
        then [ "nixpkgs=${basePath}/nixpkgs" ]
        else [
          "nixpkgs=https://gitlab.com/eadwu/nixpkgs/-/archive/develop/nixpkgs-develop.tar.gz"
          "nixpkgs=https://api.github.com/repos/eadwu/nixpkgs/tarball/develop"
        ])
      ++ lib.optional (builtins.pathExists (builtins.toPath "${basePath}/nixos-configuration/overlays"))
        "nixpkgs-overlays=${basePath}/nixos-configuration/overlays";
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };

    overlays = if builtins.pathExists <nixpkgs-overlays>
      then [ (import <nixpkgs-overlays>) ]
      else [ (import ../overlays) ];
  };

  system = {
    stateVersion = "18.09";

    autoUpgrade = {
      enable = false;
      channel = "https://nixos.org/channels/nixpkgs-unstable";
    };
  };
}
