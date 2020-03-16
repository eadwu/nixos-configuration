(use-package wakatime-mode
  :diminish
  :custom
  (wakatime-api-key "1b112c4e-d322-4252-98d8-acb8addda65d")
  (wakatime-cli-path "wakatime")
  (wakatime-python-bin "")
  :init (global-wakatime-mode)
  :commands (global-wakatime-mode))
