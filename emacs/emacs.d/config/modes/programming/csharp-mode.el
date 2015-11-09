(add-hook 'csharp-mode-hook
  (lambda()
    (electric-pair-mode 1)
    (c-set-style "java")
    (setq tab-width 4)
    (setq c-basic-offset 4)
    (setq indent-tabs-mode nil)))
(add-to-list 'auto-mode-alist '("\\.cs" . csharp-mode))
