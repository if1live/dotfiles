(defun less-css-mode-setup ()
  (setq tab-width 2)
  (setq css-indent-offset 2)
  (setq indent-tabs-mode nil)

  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(add-hook 'less-css-mode-hook 'less-css-mode-setup)
