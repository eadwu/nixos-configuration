(require 'constants)

(require 'app)
(require 'editor)

(eval-when-compile
  (require 'use-package))
(use-package bind-key)

(let ((libraries-loaded (mapcar #'file-name-sans-extension (delq nil (mapcar #'car load-history)))))
  (dolist (file (directory-files-recursively (concat user-emacs-modules-directory) ".+\\.elc?$"))
    (let ((library (file-name-sans-extension file)))
      (unless (member library libraries-loaded)
        (load library nil t)
        (push library libraries-loaded)))))

(provide 'core)
