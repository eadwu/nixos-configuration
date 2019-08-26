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

  security.pki.certificateFiles = [ ../credentials/ca.pem ../credentials/melon-ca.pem ];
  environment.etc = {
    "wpa_supplicant/ca.pem".source = ../credentials/ca.pem;
    "wpa_supplicant/melon-ca.pem".source = ../credentials/melon-ca.pem;
    "wpa_supplicant/eduroam".source = ../credentials/eduroam;
  };

  networking.wireless = {
    enable = true;
    driver = "wext,nl80211";

    networks.eduroam.auth = ''
      eap=PEAP
      auth_alg=OPEN
      key_mgmt=WPA-EAP
      proto=WPA RSN
      pairwise=CCMP
      group=CCMP TKIP
      identity="edmundwu@buffalo.edu"
      anonymous_identity="notastudentatbuffalo@buffalo.edu"
      password=hash:${builtins.readFile ../credentials/eduroam}
      phase1="peaplabel=0"
      phase2="auth=MSCHAPV2"
    '';
  };
}
