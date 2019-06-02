{ config, pkgs, ... }:

let
  home-manager = (import (builtins.fetchTarball {
    url = "https://api.github.com/repos/rycee/home-manager/tarball/master";
  }) { });
in with config.nixos; {
  imports =
    [
      home-manager.nixos
    ];

  home-manager.users."${settings.system.user}" = { ... }: {
    imports =
      [
        ./home-manager
      ];
  };

  users = {
    defaultUserShell = "${pkgs.zsh}/bin/zsh";

    users = {
      "${settings.system.user}" = {
        createHome = true;
        extraGroups = [
          "wheel"
          "docker"
          "libvirtd"
          "networkmanager"
        ];
        group = "users";
        home = settings.system.home;
        passwordFile = settings.system.credentials;
        uid = 1000;
        useDefaultShell = true;
      };
    };
    mutableUsers = false;
  };
}
