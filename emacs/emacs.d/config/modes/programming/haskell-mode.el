(defun my-haskell-before-save-hook ()
  (delete-trailing-whitespace))

(defun haskell-mode-setup ()
  (turn-on-haskell-indentation)
  (add-hook 'before-save-hook 'my-haskell-before-save-hook))

(add-hook 'haskell-mode-hook 'haskell-mode-setup)
