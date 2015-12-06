(defun my-js-before-save-hook ()
  (delete-trailing-whitespace))

(defun js-mode-setup ()
  ;; indent
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 2)
  (setq js-indent-level 2)
  (setq default-tab-width 2)
  (setq tab-stop-list (number-sequence 2 200 2))
  ;; hooks
  (add-hook 'before-save-hook 'my-js-before-save-hook))

(add-hook 'js-mode-hook 'js-mode-setup)
