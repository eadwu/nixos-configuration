(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)

(electric-pair-mode t)
(global-hl-line-mode t)
(color-theme-sanityinc-tomorrow-night)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-to-list
 'default-frame-alist
 '(font . "IBM Plex Mono-8"))

(setq cursor-in-non-selected-windows t
      display-line-numbers-current-absolute t
      fill-column 80
      indent-line-function 'insert-tab
      require-final-newline t
      tab-width 2)

(setq-default buffer-file-coding-system 'utf-8-unix
              display-line-numbers 'relative
              indent-tabs-mode nil
              initial-major-mode 'fundamental-mode
              line-spacing 8)

(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(provide 'editor)
