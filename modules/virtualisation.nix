{ config, pkgs, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
    };

    virtualbox = {
      host = {
        enable = config.boot.kernelPackages.kernel.version != pkgs.linux_testing.version;
      };
    };
  };
}
