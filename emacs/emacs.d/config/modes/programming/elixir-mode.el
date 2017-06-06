(defun elixir-mode-setup ()
  ;; indent
  (setq tab-width 2)
  (setq c-basic-offset 2)
  (setq indent-tabs-mode nil)

  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(add-hook 'elixir-mode-hook 'elixir-mode-setup)
