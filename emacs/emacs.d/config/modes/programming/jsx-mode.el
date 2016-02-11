(autoload 'jsx-mode "jsx-mode" "JSX mode" t)

(defun jsx-mode-setup ()
  (setq jsx-indent-level 2)
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))

  (add-hook 'before-save-hook 'delete-trailing-whitespace))
(add-hook 'jsx-mode-hook 'jsx-mode-setup)
