(use-package wakatime-mode
  :diminish
  :custom
  (wakatime-api-key "f2772a4b-94b1-4ac1-9712-b9a743b09897")
  (wakatime-cli-path "wakatime")
  (wakatime-python-bin "")
  :init (global-wakatime-mode)
  :commands (global-wakatime-mode))
