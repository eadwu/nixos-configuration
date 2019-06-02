{ ... }:

{
  home.file = {
    ".emacs.d/custom.el".source = ./emacs/custom.el;
    ".emacs.d/init.el".source = ./emacs/init.el;
    ".emacs.d/core".source = ./emacs/core;
    ".emacs.d/modules".source = ./emacs/modules;
  };
}
