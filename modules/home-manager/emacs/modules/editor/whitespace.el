(use-package whitespace
  :diminish
  :custom
  (whitespace-style (quote (face empty trailing tab-mark space-mark newline-mark)))
  (whitespace-display-mappings '(
                               (space-mark   ?\    [?\u00B7]     [?.])
                               (space-mark   ?\xA0 [?\u00A4]     [?_])
                               (newline-mark ?\n   [?\u21B5 ?\n] [?$ ?\n])
                               (tab-mark ?\t       [?\u00BB ?\t] [?\\ ?\t])))
  :init (global-whitespace-mode)
  :commands (global-whitespace-mode))
