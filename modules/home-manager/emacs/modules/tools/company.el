(use-package company
  :diminish
  :custom
  (company-idle-delay 0.2)
  (company-minimum-prefix-length 1)
  (company-tooltip-align-annotations t)
  (company-begin-commands '(self-insert-command))
  :init (global-company-mode)
  :commands (global-company-mode))

(use-package company-lsp
  :after company
  :config
  (push 'company-lsp company-backends))

(use-package company-web-html)
(use-package company-web-jade)
(use-package company-web-slim)
