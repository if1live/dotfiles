(add-to-list 'auto-mode-alist '("zshrc$" . shell-script-mode))
(add-to-list 'auto-mode-alist '(".sh$" . shell-script-mode))

(defun my-shell-script-before-save-hook ()
  (delete-trailing-whitespace))

(defun shell-script-mode-setup ()
  (add-hook 'before-save-hook 'my-shell-script-before-save-hook))

(add-hook 'shell-script-mode 'shell-script-mode-setup)
(add-hook 'sh-mode 'shell-script-mode-setup)
