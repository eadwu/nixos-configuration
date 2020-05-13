{ config, pkgs, ... }:

assert builtins.pathExists ./mpd/mpd.conf;

with config.nixos; {
  home.packages = with pkgs; [
    mpd
    ncmpcpp
  ];

  services.mpd = {
    enable = true;
    extraConfig = builtins.readFile ./mpd/mpd.conf;
    musicDirectory = "${config.home.homeDirectory}/Music";

    network = {
      listenAddress = "127.0.0.1";
      port = 6600;
    };
  };
}
