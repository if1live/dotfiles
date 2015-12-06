(defun my-erlang-before-save-hook ()
  (delete-trailing-whitespace))

(defun erlang-mode-setup ()
  ;; indent
  (setq c-basic-offset 4)

  ;; hooks
  (add-hook 'before-save-hook 'my-erlang-before-save-hook))

(add-hook 'erlang-mode-hook 'erlang-mode-setup)
