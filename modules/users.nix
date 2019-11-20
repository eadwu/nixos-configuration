{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball {
    url = "https://api.github.com/repos/rycee/home-manager/tarball/master";
  };
in
  with config.nixos; {
    imports =
      [
        "${home-manager}/nixos"
      ];

    home-manager = {
      useUserPackages = true;
      users."${settings.system.user}" = (
        { sysConfig }: { ... }: {
          imports = [ ./home-manager ../options/home-manager.nix ];
          inherit sysConfig;
        }
      ) { sysConfig = config; };
    };

    users = {
      defaultUserShell = "${pkgs.zsh}/bin/zsh";

      users = {
        "${settings.system.user}" = {
          uid = 1000;
          createHome = true;
          useDefaultShell = true;

          home = settings.system.home;
          passwordFile = settings.system.credentials;

          group = "users";
          extraGroups = [
            "wheel"
            "docker"
            "libvirtd"
            "networkmanager"
          ];
        };
      };
      mutableUsers = false;
    };
  }
