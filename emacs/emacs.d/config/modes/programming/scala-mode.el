(defun my-scala-before-save-hook ()
  (delete-trailing-whitespace))

(defun scala-mode-setup ()
  (add-hook 'before-save-hook 'my-scala-before-save-hook))

(add-hook 'scala-mode-hook 'scala-mode-setup)
