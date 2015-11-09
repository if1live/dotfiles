(add-hook 'js-mode-hook
  (lambda ()
    (setq-default indent-tabs-mode nil)
    (setq-default tab-width 2)
    (setq js-indent-level 2)
    (setq default-tab-width 2)
    (setq tab-stop-list (number-sequence 2 200 2))))
