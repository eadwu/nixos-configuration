{ pkgs, ... }:

{
  services.emacs.enable = true;
  services.emacs.package = pkgs._aliases.emacs;
}
