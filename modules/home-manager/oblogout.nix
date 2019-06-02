{ pkgs, ... }:

{
  home.file. ".themes/adeos-cores".source = "${builtins.fetchGit {
    url = "https://github.com/bruhensant/Adeos-Oblogout";
  }}/adeos-cores";
}
