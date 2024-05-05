{ options, config, flakes, pkgs, lib, modulesPath, ... }:

{
  imports =
    [
      ../../configurations/wsl
      ../../configurations/wsl/wslg.nix
    ];

  wsl.dependencies.distro = [ "caelus" ];

  services.openssh.ports = [ 25 ];

  time.timeZone = "America/Los_Angeles";

  wsl.defaultUser = "abyssus";
  networking.hostName = config.wsl.defaultUser;

  environment.variables.MESA_D3D12_DEFAULT_ADAPTER_NAME = "NVIDIA";

  environment.systemPackages = with pkgs; [
    chromium
    vivaldi-snapshot
  ];
}
