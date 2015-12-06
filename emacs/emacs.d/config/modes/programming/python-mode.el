(defun my-python-before-save-hook ()
  (delete-trailing-whitespace))

(defun python-mode-setup ()
  ;; indent
  (setq python-indent 4)

  ;; jedi - python ide
  (jedi:setup)
  (setq jedi:setup-keys t)                      ; optional
  (setq jedi:complete-on-dot t)                 ; optional

  ;; hooks
  (add-hook 'before-save-hook 'my-python-before-save-hook))

(add-hook 'python-mode-hook 'python-mode-setup)
