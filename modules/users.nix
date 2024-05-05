{ nixosModules, flakes, config, pkgs, ... }@args:

with config.nixos; {
  imports =
    [
      # nixosModules.home-manager
      flakes.home-manager.nixosModules.home-manager
    ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    verbose = true;
    extraSpecialArgs = {
      inherit flakes;
      sysConfig = config;
    };
    users."${settings.system.user}".imports = [ ../home-manager ];
  };

  # security.pam.loginLimits = [
  #   { domain = "@users"; type = "soft"; item = "nofile"; value = "4086"; }
  # ];

  users = {
    defaultUserShell = "${pkgs.zsh}/bin/zsh";

    users = {
      "${settings.system.user}" = {
        uid = 1000;
        createHome = true;
        isNormalUser = true;
        useDefaultShell = true;

        home = settings.system.home;
        # passwordFile = settings.system.credentials;
        # hashedPassword = "$6$Zy5ii9azByIjBU.a$orx.EicQS5h5Wu6WjJH9j6I1qNceEuZvjB.3LI4szCgDJ.wgiSXctehf8lwkXBpAksVxQAGYECGvBMpzmTKo..";
        hashedPassword = "$6$OP0SmGHbJ.S1nYqw$XJ/7YwxJxWWRXdMZQlBD/2gErZr1amQWRA.8a8JMKULCkWTOuJcXEOv0kfCwaBIiu0PbBv.kOpsJNIRNWJe8d0";

        group = "users";
        extraGroups = [
          "kvm"
          "disk" # block device access
          "tss" # tpm device access
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
