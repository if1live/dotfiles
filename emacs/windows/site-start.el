;; add this file to <windows emacs directory>/site-lisp
;; then home directory is c:/home/emacs, something like this.
;; example : C:/bin/emacs-24.3/site-lisp/site-start.el
;; http://libsora.so/posts/emacs-home-dir/
(defvar %~dp0 (substring data-directory 0 3)) (defvar home-dir (concat %~dp0 "home/emacs/"))
(setenv "HOME" home-dir)
