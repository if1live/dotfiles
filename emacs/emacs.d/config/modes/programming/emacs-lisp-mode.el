;; http://www.emacswiki.org/emacs/EmacsLispMode
(add-to-list 'auto-mode-alist '(".emacs" . emacs-lisp-mode))
(add-hook 'emacs-lisp-mode-hook
  (lambda ()
    (setq tab-width 2)
    ;; Use spaces, not tabs.
    (setq indent-tabs-mode nil)
    (put 'add-hook 'lisp-indent-function 1)
    (put 'function 'lisp-indent-function 2)))
