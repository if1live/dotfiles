(add-hook 'lisp-mode-hook
  (lambda ()
    (setq indent-tabs-mode nil)
    (setq tab-width 2)
    (set (make-local-variable 'lisp-indent-function)
         'common-lisp-indent-function)))
