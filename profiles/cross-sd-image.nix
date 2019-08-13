{ pkgs, lib, ... }:

with lib; {
  imports = [ ./sd-image.nix ];

  # Setup cross compilation
  nixpkgs.crossSystem = systems.elaborate systems.examples.aarch64-multiplatform;

  # Only redistributable firmware that fails is alsa-firmware
  # Though only raspberrypiWirelessFirmware is needed for the rpi3b+
  hardware.firmware = mkForce [ pkgs.raspberrypiWirelessFirmware ];
  hardware.enableRedistributableFirmware = mkForce false;

  # Don't need X dependencies
  programs.ssh.setXAuthLocation = mkForce false;
  security.pam.services.su.forwardXAuth = mkForce false;

  # Fails to compile
  documentation.enable = false;
  documentation.info.enable = false;
  services.nixosManual.showManual = mkForce false;
  fonts.fontconfig.enable = mkForce false;
  security.polkit.enable = mkForce false;
}
