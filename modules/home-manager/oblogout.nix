{ pkgs, ... }:

{
  home.file. ".themes/adeos-archlabs".source = "${builtins.fetchTarball {
    url = "https://github.com/bruhensant/adeos-archlabs/archive/master.tar.gz";
  }}/adeos-archlabs";
}
