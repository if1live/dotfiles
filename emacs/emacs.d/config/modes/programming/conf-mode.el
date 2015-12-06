(defun my-conf-before-save-hook ()
  (delete-trailing-whitespace))

(defun conf-mode-setup ()
  (add-hook 'before-save-hook 'my-conf-before-save-hook))

(add-hook 'conf-mode-hook 'conf-mode-setup)
