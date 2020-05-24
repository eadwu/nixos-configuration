{ pkgs, ... }:

{
  networking.firewall = {
    allowedTCPPorts = [ 53 80 443 ];
    allowedUDPPorts = [ 53 67 ];
    # https://freek.ws/2017/03/18/blocking-dns-amplification-attacks-using-iptables/
    extraCommands = ''
      ip46tables -A INPUT -p udp --dport 53 -m string --from 40 --algo bm --hex-string '|0000FF0001|' -m recent --set --name dnsanyquery
      ip46tables -A INPUT -p udp --dport 53 -m string --from 40 --algo bm --hex-string '|0000FF0001|' -m recent --name dnsanyquery --rcheck --seconds 60 --hitcount 3 -j DROP
      ip46tables -A INPUT -p tcp --dport 53 -m string --from 52 --algo bm --hex-string '|0000FF0001|' -m recent --set --name dnsanyquery
      ip46tables -A INPUT -p tcp --dport 53 -m string --from 52 --algo bm --hex-string '|0000FF0001|' -m recent --name dnsanyquery --rcheck --seconds 60 --hitcount 3 -j DROP
    '';
  };

  virtualisation.docker.enable = true;
  virtualisation.docker.autoPrune = {
    enable = true;
    flags = [ "--all" ];
  };

  # https://github.com/pi-hole/docker-pi-hole
  systemd.tmpfiles.rules = [
    "d /var/pihole/pihole 0750 - - -"
    "d /var/pihole/dnsmasq.d 0750 - - -"
  ];

  systemd.services.nixops-docker-pihole = {
    after = [ "docker.service" "network-online.target" "dhcpd.service" ];
    requires = [ "docker.service" ];
    wantedBy = [ "docker.service" ];

    path = [ pkgs.docker ];
    description = "Pi-Hole docker container";
    serviceConfig = {
      Type = "oneshot";
      Restart = "no";
    };

    script = ''
      docker pull pihole/pihole:latest
      docker ps --format 'table {{.Names}}' | grep -q pipihole && docker rm -f pipihole

      docker run --detach --name pipihole \
        -p 53:53/tcp -p 80:80 -p 443:443 \
        -p 53:53/udp -p 67:67/udp \
        --env TZ="America/New_York" \
        --env DNS1="1.1.1.1" --env DNS2="1.0.0.1" \
        --volume "/var/pihole/pihole/:/etc/pihole/" \
        --volume "/var/pihole/dnsmasq.d/:/etc/dnsmasq.d/" \
        --dns=127.0.0.1 --dns=1.1.1.1 \
        --restart=unless-stopped \
        pihole/pihole:latest
    '';
  };
}
