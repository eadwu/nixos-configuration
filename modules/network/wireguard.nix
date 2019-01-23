{ config, pkgs, lib, ... }:

with config.nixos; {
  imports =
    [
      ../../options/dhcpcd.nix
      ../../options/wireguard.nix
    ];

  disabledModules =
    [
      <nixpkgs/nixos/modules/services/networking/dhcpcd.nix>
      <nixpkgs/nixos/modules/services/networking/wireguard.nix>
    ];

  networking.wireguard = {
    namespace = settings.wireguard.client.netns;
    interfaces = {
      wg0 = rec {
        ips = settings.wireguard.client.addresses;
        privateKeyFile = settings.wireguard.client.credentials;

        peers = [
          { publicKey = settings.wireguard.server.credentials;
            endpoint = "${settings.wireguard.server.address}:51820";
            persistentKeepalive = 25;
            allowedIPs = [ "0.0.0.0/0" ]; }
        ];

        postSetup = ''
          ${pkgs.systemd}/bin/systemctl restart --no-block wpa_supplicant dhcpcd
        '';

        postShutdown = postSetup;
      };
    };
  };

  systemd.services.wpa_supplicant = {
    path = with pkgs; [ gnugrep iproute ];

    script = lib.mkForce ''
      for i in $(ip link | grep -Po 'wl.*?(?=:)'); do
        ifaces="$ifaces''${ifaces:+ -N} -i$i"
      done

      exec wpa_supplicant -s -u \
        -D${config.networking.wireless.driver} \
        -c /etc/wpa_supplicant.conf \
        $ifaces
    '';
  };
}
