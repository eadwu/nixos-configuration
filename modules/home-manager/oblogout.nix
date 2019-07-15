{ pkgs, ... }:

{
  home.file. ".themes/adeos-archlabs".source = "${builtins.fetchGit {
    url = "https://github.com/bruhensant/adeos-archlabs";
    ref = "master";
  }}/adeos-archlabs";
}
