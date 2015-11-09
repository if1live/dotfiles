(custom-set-variables
 ;; Show column number on the status line
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(show-paren-mode t))


;;;;;;;;;;;;
;; Reference
;; http://dotfiles.org/~battlemidget/.emacs
;;;;;;;;;;;;

;; emacs base setting
(package-initialize)

;; Cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; http://stackoverflow.com/questions/10026221/enable-all-disabled-commands-permanently
;; Enable all disabled commands permanently
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'erase-buffer 'disabled nil)


(load "~/.emacs.d/load-directory.el")
(load-directory "~/.emacs.d/config")
