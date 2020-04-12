(use-package projectile
  :after (hydra counsel)
  :config
  (defhydra projectile (:color blue)
    ("q" nil)))

;; (defhydra hydra-projectile (:color blue)
;;   "
;;   ^
;;   ^Projectile^        ^Buffers^           ^Find^              ^Search^
;;   ^──────────^────────^───────^───────────^────^──────────────^──────^────────────
;;   _q_ quit            _b_ list            _d_ directory       _r_ replace
;;   _i_ reset cache     _K_ kill all        _D_ root            _R_ regexp replace
;;   ^^                  _S_ save all        _f_ file            _s_ ag
;;   ^^                  ^^                  _p_ project         ^^
;;   ^^                  ^^                  ^^                  ^^
;;   "
;;   ("q" nil)
;;   ("b" counsel-projectile-switch-to-buffer)
;;   ("d" counsel-projectile-find-dir)
;;   ("D" projectile-dired)
;;   ("f" counsel-projectile-find-file)
;;   ("i" projectile-invalidate-cache :color red)
;;   ("K" projectile-kill-buffers)
;;   ("p" counsel-projectile-switch-project)
;;   ("r" projectile-replace)
;;   ("R" projectile-replace-regexp)
;;   ("s" counsel-projectile-ag)
;;   ("S" projectile-save-project-buffers))
