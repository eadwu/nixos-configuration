(use-package nix-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
  :custom
  (nix-indent-function 'nix-indent-line))
