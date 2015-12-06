(add-to-list 'auto-mode-alist '("\\.rkt" . scheme-mode))

(defun my-scheme-before-save-hook ()
  (delete-trailing-whitespace))

(defun scheme-mode-setup ()
  ;; indent
  (setq tab-width 2)
  (setq indent-tabs-mode nil)

  (add-hook 'before-save-hook 'my-scheme-before-save-hook))

(add-hook 'scheme-mode-hook 'scheme-mode-setup)
