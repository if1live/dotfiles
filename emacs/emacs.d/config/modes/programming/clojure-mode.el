(defun my-clojure-before-save-hook ()
  (delete-trailing-whitespace))

(defun clojure-mode-setup ()
  (add-hook 'before-save-hook 'my-clojure-before-save-hook))

(add-hook 'clojure-mode-hook 'clojure-mode-setup)
