(use-package tide
  :after (company flycheck)
  :preface)

;; (use-package tide
;;   :after (company flycheck)
;;   :preface
;;   (defun setup-tide-mode ()
;;     (interactive)
;;     (tide-setup)
;;     (flycheck-mode +1)
;;     (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;     (eldoc-mode +1)
;;     (tide-hl-identifier-mode +1)
;;     (company-mode +1))
;;   :hook (before-save . tide-format-before-save))
