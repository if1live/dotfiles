(add-hook 'python-mode-hook
  (lambda ()
    (setq python-indent 4)))

;; jedi - python ide
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional
;; // jedi
