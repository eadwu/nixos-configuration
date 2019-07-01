(use-package flycheck
  :defer 2
  :diminish
  :init (global-flycheck-mode)
  :commands (global-flycheck-mode))

(use-package flycheck-inline
  :after flycheck
  :custom
  (flycheck-inline-mode))
