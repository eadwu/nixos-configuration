{ lib, ... }:

{
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
      password=hash:${builtins.readFile /etc/wpa_supplicant/eduroam}
      phase1="peaplabel=0"
      phase2="auth=MSCHAPV2"
    '';
  };

  # Prefer ethernet over wireless connections
  systemd.services.wpa_supplicant.wantedBy = lib.mkForce [];
}
