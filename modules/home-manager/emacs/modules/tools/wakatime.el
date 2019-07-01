(use-package wakatime-mode
  :diminish
  :custom
  (wakatime-api-key "83e9edbb-e265-4cdd-b39b-5442e77c806b")
  (wakatime-cli-path "wakatime")
  (wakatime-python-bin "")
  :init (global-wakatime-mode)
  :commands (global-wakatime-mode))
