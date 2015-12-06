(defun my-java-before-save-hook ()
  (delete-trailing-whitespace))

(defun java-mode-setup ()
  (add-hook 'before-save-hook 'my-java-before-save-hook))

(add-hook 'java-mode-hook 'java-mode-setup)
