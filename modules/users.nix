{ nixosModules, flakes, config, pkgs, ... }:

with config.nixos; {
  imports =
    [
      nixosModules.home-manager
    ];

  home-manager = {
    useUserPackages = true;
    users."${settings.system.user}" = (
      { flakes, sysConfig }: { ... }: {
        imports = [ ../home-manager ];
        _module.args = { inherit flakes sysConfig; };
      }
    ) { inherit flakes; sysConfig = config; };
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
          "kvm"
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
