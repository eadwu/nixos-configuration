{ flakes, options, config, pkgs, lib, modulesPath, ... }:

{
  imports =
    [
      ../../configurations/wsl

      # ./config.nix
    ];

  wsl.dependencies.distro = lib.mkForce []; 

  wsl.defaultUser = "caelus";
  networking.hostName = config.wsl.defaultUser;

  time.timeZone = "America/Los_Angeles";

  services.openssh.ports = [ 23 ];
}
