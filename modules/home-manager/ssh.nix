{ config, ... }:

{
  programs.ssh = {
    enable = true;
    hashKnownHosts = true;
  };
}
