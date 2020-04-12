(column-number-mode t)
(display-battery-mode t)
(size-indication-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

(setq frame-title-format (list "%b%[ - GNU %F " emacs-version)
      gc-cons-threshold 50000000
      help-window-select t
      icon-title-format (list "%b- GNU %F " emacs-version)
      inhibit-startup-screen t
      initial-scratch-message nil
      view-read-only t)

(setq-default inhibit-default-init t
              create-lockfiles nil
              history-length 500
              vc-follow-symlinks t)

(let ((autosaves-dir (concat user-emacs-cache-directory "autosaves/"))
      (backup-dir (concat user-emacs-cache-directory "backups/")))
  (dolist (dir (list backup-dir autosaves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq-default
   auto-save-file-name-transforms `((".*" ,autosaves-dir t))
   backup-by-copying 5
   backup-directory-alist (list (cons "." backup-dir))
   delete-old-versions t
   kept-new-versions 20
   kept-old-versions 5
   tramp-auto-save-directory autosaves-dir
   tramp-backup-directory-alist backup-directory-alist
   version-control t))

(provide 'app)
