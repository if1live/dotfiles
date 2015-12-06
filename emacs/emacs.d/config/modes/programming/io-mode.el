(defun my-io-before-save-hook ()
  (delete-trailing-whitespace))

(defun io-mode-setup ()
  (add-hook 'before-save-hook 'my-io-before-save-hook))

(add-hook 'io-mode-hook 'io-mode-setup)
