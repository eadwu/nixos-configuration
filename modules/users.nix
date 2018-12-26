{ config, pkgs, ... }:

with config.nixos.custom; {
  users = {
    defaultUserShell = "${pkgs.zsh}/bin/zsh";
    extraUsers = {
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
