(use-package tex
  ;; :hook (LaTeX-mode . reftex-mode)
  :custom
  (TeX-PDF-mode t)
  (TeX-auto-save t)
  ;; (TeX-byte-compile t)
  (TeX-clean-confirm nil)
  (TeX-parse-self t))

;; (use-package tex
;;   :hook (LaTeX-mode . reftex-mod)
;;   :custom
;;   (TeX-PDF-mode t)
;;   (TeX-auto-save t)
;;   (TeX-byte-compile t)
;;   (TeX-clean-confirm nil)
;;   (TeX-master 'dwim)
;;   (TeX-parse-self t)
;;   (TeX-source-correlate-mode t)
;;   (TeX-view-program-selection '((output-pdf "Evince")
;;                                 (output-html "xdg-open"))))

(use-package company-auctex
  :after (auctex company)
  :custom
  (company-auctex-init))
