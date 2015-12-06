(defun my-c-before-save-hook ()
  (delete-trailing-whitespace))

(defun c-mode-setup ()
  ;; indent
  (setq tab-width 2)
  (setq c-basic-offset 2)
  (setq indent-tabs-mode nil)

  ;; hooks
  (add-hook 'before-save-hook 'my-c-before-save-hook))

(add-hook 'c-mode-hook 'c-mode-setup)
