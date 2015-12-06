(defun my-slim-before-save-hook ()
  (delete-trailing-whitespace))

(defun slim-mode-setup ()
  (add-hook 'before-save-hook 'my-slim-before-save-hook))

(add-hook 'slim-mode-hook 'slim-mode-setup)
