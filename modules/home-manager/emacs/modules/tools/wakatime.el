(use-package wakatime-mode
  :diminish
  :custom
  (wakatime-api-key "6a897370-7dac-4908-b861-263e46347c4c")
  (wakatime-cli-path "wakatime")
  (wakatime-python-bin "")
  :init (global-wakatime-mode)
  :commands (global-wakatime-mode))
