{ config, pkgs, ... }:

let
  settings = import ../settings.nix;
in with settings; {
  users = {
    defaultUserShell = "${pkgs.zsh}/bin/zsh";
    extraUsers = {
      "${user}" = {
        createHome = true;
        extraGroups = [
          "docker"
          "networkmanager"
          "wheel"
        ];
        group = "users";
        home = HOME;
        passwordFile = passwordFile;
        uid = 1000;
        useDefaultShell = true;
      };
    };
    mutableUsers = false;
  };
}
