{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [ direnv ];
  services.lorri.enable = true;
  programs.zsh.interactiveShellInit = lib.mkAfter ''
    eval "$(direnv hook zsh)"
  '';
}
