{ config, pkgs, lib, ... }:

let
  settings = import ../settings.nix;
in with settings; {
  nix = {
    buildCores = 0;
    package = pkgs.nixUnstable;
    requireSignedBinaryCaches = true;
    useSandbox = true;

    binaryCaches = [
      "https://cache.nixos.org/"

      # Cachix
      "https://emacs.cachix.org"
      "https://linux.cachix.org"
      "https://qt5.cachix.org"
      "https://texlive.cachix.org"
      "https://wu.cachix.org"
    ];

    binaryCachePublicKeys = [
      "hydra.nixos.org-1:CNHJZBh9K4tP3EKF6FkkgeVYsS3ohTl+oS0Qa8bezVs="

      "emacs.cachix.org-1:BgvmrJ8yBNHewnYF2wsp+yrPz+Rx7zrLSsevcVrL3Lg="
      "linux.cachix.org-1:FgNkZq0e26bKnTHgvxT0Tz4bJxIuvbXY62bSyJbPxbc="
      "qt5.cachix.org-1:Ka/DtafK6EmdVWthzRpYo+N0j0X6j7gUOIfenczmV7s="
      "texlive.cachix.org-1:OWd0kb4Wkw8F7T0+sSAPzyOo/pH+NEqIhAWty25oCLk="
      "wu.cachix.org-1:cHow32fFlXna8uBQA6yoo+505O5eImitDtdXu2JYd0Y="
    ];

    nixPath = [
      "/etc/nixos"
      "nixos-config=/etc/nixos/configuration.nix"
    ] ++ (if builtins.pathExists (/. + "${HOME}/Downloads/nixpkgs")
      then [ "nixpkgs=${HOME}/Downloads/nixpkgs" ]
      else [
        "nixpkgs=https://gitlab.com/eadwu/nixpkgs/-/archive/develop/nixpkgs-develop.tar.gz"
        "nixpkgs=https://api.github.com/repos/eadwu/nixpkgs/tarball/develop"
      ]);
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };

    overlays = import ../overlays;
  };

  system = {
    stateVersion = "18.09";

    autoUpgrade = {
      enable = false;
      channel = https://nixos.org/channels/nixpkgs-unstable;
    };
  };
}
