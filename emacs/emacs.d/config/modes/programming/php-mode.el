(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

(defun my-php-before-save-hook ()
  (delete-trailing-whitespace))

(defun php-mode-setup ()
  ;; variables
  (setq php-mode-force-pear t)

  ;; indent
  (setq c-default-style "stroustrup")
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq c-basic-indent 4)

  ;; hooks
  (add-hook 'before-save-hook 'my-php-before-save-hook))

(add-hook 'php-mode-hook 'php-mode-setup)
