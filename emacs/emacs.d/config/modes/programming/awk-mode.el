(defun my-awk-before-save-hook ()
  (delete-trailing-whitespace))

(defun awk-mode-setup ()
  (setq tab-width 4)
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil)

  (add-hook 'before-save-hook 'my-awk-before-save-hook))

(add-hook 'awk-mode-hook 'awk-mode-setup)
