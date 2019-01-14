{ config, pkgs, ... }:

with config.nixos; {
  users = {
    defaultUserShell = "${pkgs.zsh}/bin/zsh";

    users = {
      "${settings.system.user}" = {
        createHome = true;
        extraGroups = [
          "docker"
          "networkmanager"
          "wheel"
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
