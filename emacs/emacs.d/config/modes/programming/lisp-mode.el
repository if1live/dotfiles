(add-to-list 'auto-mode-alist '("\\cask$" . lisp-mode))

(defun my-lisp-before-save-hook ()
  (delete-trailing-whitespace))

(defun lisp-mode-setup ()
  ;; indent
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (set (make-local-variable 'lisp-indent-function)
       'common-lisp-indent-function)

  ;; hooks
  (add-hook 'before-save-hook 'my-lisp-before-save-hook))

(add-hook 'lisp-mode-hook 'lisp-mode-setup)
(add-hook 'emacs-lisp-mode-hook 'lisp-mode-setup)
