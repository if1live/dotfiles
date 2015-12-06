(defun my-latex-before-save-hook ()
  (delete-trailing-whitespace))

(defun latex-mode-setup ()
  (add-hook 'before-save-hook 'my-latex-before-save-hook))

(add-hook 'latex-mode-hook 'latex-mode-setup)
