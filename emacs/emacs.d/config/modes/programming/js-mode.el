(defun my-js-before-save-hook ()
  (delete-trailing-whitespace))

(defun js-mode-setup ()
  ;; indent
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (setq js-indent-level 2)

  ;; hooks
  (add-hook 'before-save-hook 'my-js-before-save-hook))

(add-hook 'js-mode-hook 'js-mode-setup)
