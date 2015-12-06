(defun my-git-mode-before-save-hook ()
  (delete-trailing-whitespace))

(defun git-mode-setup ()
  (add-hook 'before-save-hook 'my-git-mode-before-save-hook))

(add-hook 'gitignore-mode 'git-mode-setup)
(add-hook 'gitconfig-mode 'git-mode-setup)
(add-hook 'gitattributes-mode 'git-mode-setup)
