{ pkgs, ... }:

assert builtins.pathExists ./xmonad/xmonad.hs;

{
  home.packages = with pkgs; [
    polybar
  ];

  home.sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = 1;
  };

  xsession.windowManager.xmonad = {
    enable = true;
    haskellPackages = pkgs.haskellPackages;
    enableContribAndExtras = true;
    config = ./xmonad/xmonad.hs;
  };
}
