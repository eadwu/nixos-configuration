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

  systemd.services.spew-debug-flies = {
    wantedBy = [ "network.target" "multi-user.target" ];

    enable = true;

    script = ''
      ${pkgs.iproute}/bin/ip a

      if [ -e /sys/class/net/eth0 ]; then
        echo "eth0"
        cat /sys/class/net/eth0/address
        ${pkgs.iproute}/bin/ip link show eth0
      fi

      if [ -e /sys/class/net/enx* ]; then
        echo "enx*"
        cat /sys/class/net/enx*/address
      fi

      if [ -e /sys/class/net/wlan0 ]; then
        echo "wlan0"
        cat /sys/class/net/wlan0/address
        ${pkgs.iproute}/bin/ip link show wlan0
      fi
    '';
  };

  networking.enableIPv6 = false;
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
