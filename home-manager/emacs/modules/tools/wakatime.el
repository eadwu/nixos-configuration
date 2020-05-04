(use-package wakatime-mode
  :diminish
  :custom
  (wakatime-api-key "28d14c5d-9a71-440c-a671-2b84e557c69d")
  (wakatime-cli-path "wakatime")
  (wakatime-python-bin "")
  :init (global-wakatime-mode)
  :commands (global-wakatime-mode))
