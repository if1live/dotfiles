(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
(add-hook 'dockerfile-mode-hook
  (lambda ()
    (setq tab-width 2)
    (setq indent-tabs-mode nil)))
