(defun my-makefile-before-save-hook ()
  (delete-trailing-whitespace))

(defun makefile-mode-setup ()
  ;; hooks
  (add-hook 'before-save-hook 'my-makefile-before-save-hook))

(add-hook 'makefile-gmake-mode-hook 'makefile-mode-setup)
(add-hook 'makefile-mode-hook 'makefile-mode-setup)
