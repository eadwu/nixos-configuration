(require 'package)

(setq load-prefer-newer t
      package-archives nil
      package-enable-at-startup nil)

(setq-default custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file t))

(add-to-list 'load-path (concat user-emacs-directory "core/"))
(require 'core)
