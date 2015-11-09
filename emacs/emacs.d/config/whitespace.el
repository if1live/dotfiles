;; Visible whitespace
;; Reference
;; http://emacswiki.org/emacs/WhiteSpace
;; http://emacswiki.org/emacs/ShowWhiteSpace
;; http://stackoverflow.com/questions/6378831/emacs-globally-enable-whitespace-mode

(require 'whitespace)
(autoload 'whitespace-mode           "whitespace" "Toggle whitespace visualization."        t)
(autoload 'whitespace-toggle-options "whitespace" "Toggle local `whitespace-mode' options." t)

(setq-default whitespace-style '(face trailing tabs empty newline tab-mark))

(global-whitespace-mode 1)
