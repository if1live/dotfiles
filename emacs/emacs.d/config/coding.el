;; http://www.emacswiki.org/emacs/DeletingWhitespace
;; do not use global scope before-save-hook.
;; because in markdown, trailing two spaces means newline.
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
;; detect major mode
;; http://stackoverflow.com/questions/6312202/detect-current-major-mode-in-emacs-from-lisp
(defvar delete-trailing-whitespace-language-list
  '(lisp-mode
    emacs-lisp-mode
    python-mode
    scheme-mode
    php-mode
    js-mode
    coffee-mode
    c-mode
    ruby-mode
    c++-mode
    csharp-mode
    java-mode
    shell-script-mode
    sh-mode
    slim-mode
    web-mode
    prolog-mode
    io-mode
    scala-mode
    erlang-mode
    clojure-mode
    haskell-mode
    gitignore-mode
    gitconfig-mode
    gitattributes-mode
    conf-mode
    makefile-mode
    makefile-gmake-mode
    latex-mode))
(defun my-delete-trailing-whitespace()
  (if (member major-mode delete-trailing-whitespace-language-list)
      (delete-trailing-whitespace)))
(add-hook 'before-save-hook 'my-delete-trailing-whitespace)


;; raindow-delimiters
(require 'rainbow-delimiters)
;; enable in all programming-related modes
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; // rainbow-delemiters
