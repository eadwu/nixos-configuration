{ options, config, pkgs, lib, modulesPath, ... }:

{
  /*
  wsl.dependencies.distro = [
    "caelus"
  ];
  */

  imports =
    [
      ../../configurations/wsl

      ./config.nix
    ];

  wsl.defaultUser = "aspectum";
  networking.hostName = config.wsl.defaultUser;

  time.timeZone = "America/Los_Angeles";

  services.openssh.ports = [ 27 ];

  # Allow compilation of windows executables
  nixpkgs.config.allowUnsupportedSystem = true;
}
