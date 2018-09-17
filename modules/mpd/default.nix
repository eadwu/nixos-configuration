{ config, pkgs, ... }:

let
  settings = import ../../settings.nix;
in with settings; {
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
      user = user;
      group = "users";
      musicDirectory = "${HOME}/Music";
      dataDir = "${HOME}/.config/mpd";

      network = {
        listenAddress = "127.0.0.1";
        port = 6600;
      };
    };
  };
}
