{ ... }:

{
  home.file = {
    ".emacs.d/init.el".source = ./emacs/init.el;
    ".emacs.d/core".source = ./emacs/core;
    ".emacs.d/modules".source = ./emacs/modules;
  };
}
