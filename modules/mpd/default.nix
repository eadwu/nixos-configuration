{ config, pkgs, ... }:

assert builtins.pathExists ./mpd.conf;

with config.nixos.custom; {
  environment = {
    systemPackages = with pkgs; [
      mpd
      ncmpcpp
    ];
  };

  services = {
    mpd = {
      enable = true;
      extraConfig = builtins.readFile ./mpd.conf;
      user = settings.system.user;
      group = "users";
      musicDirectory = "${settings.system.home}/Music";
      dataDir = "${settings.system.home}/.config/mpd";

      network = {
        listenAddress = "127.0.0.1";
        port = 6600;
      };
    };
  };
}
