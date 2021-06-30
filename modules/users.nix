{ nixosModules, config, pkgs, ... }@args:

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
    ) { inherit (args) flakes; sysConfig = config; };
  };

  users = {
    defaultUserShell = "${pkgs.zsh}/bin/zsh";

    users = {
      "${settings.system.user}" = {
        uid = 1000;
        createHome = true;
        isNormalUser = true;
        useDefaultShell = true;

        home = settings.system.home;
        passwordFile = settings.system.credentials;

        group = "users";
        extraGroups = [
          "kvm"
          "audio"
          "wheel"
          "docker"
          "plugdev"
          "libvirtd"
          "networkmanager"
          "systemd-journal"
        ];
      };
    };
    mutableUsers = false;
  };
}
