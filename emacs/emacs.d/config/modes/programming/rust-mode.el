(defun rust-mode-setup()
  (define-key rust-mode-map (kbd "TAB") 'company-indent-or-complete-common)
  (setq company-tooltip-align-annotations t)
  (setq rust-format-on-save t))

(add-hook 'rust-mode-hook 'rust-mode-setup)
(add-hook 'rust-mode-hook 'racer-mode)

(add-hook 'racer-mode-hook 'eldoc-mode)
(add-hook 'racer-mode-hook 'company-mode)

