{ options, config, pkgs, lib, modulesPath, ... }:

{
  imports =
    [
      ../../configurations/wsl
      ../../configurations/wsl/wslg.nix
    ];

  wsl.dependencies.distro = [ "caelus" ];

  wsl.defaultUser = "cratis";
  networking.hostName = config.wsl.defaultUser;

  # Encryption
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "curses"; # ... "qt";
  };

  time.timeZone = "America/Los_Angeles";

  environment.variables.MESA_D3D12_DEFAULT_ADAPTER_NAME = "INTEL";
  environment.systemPackages = with pkgs; [ thunderbird gnupg ];

  services.openssh.ports = [ 24 ];
}
