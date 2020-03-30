(use-package ein
  :custom
  (ein:jupyter-server-command "jupyter-notebook")
  (ein:jupyter-server-use-subcommand ""))

(use-package elpy
  :after ein flycheck
  :init
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode)
  :config
  (elpy-enable))
