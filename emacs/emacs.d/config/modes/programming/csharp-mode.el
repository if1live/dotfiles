(add-to-list 'auto-mode-alist '("\\.cs" . csharp-mode))

(defun my-csharp-before-save-hook ()
  (delete-trailing-whitespace))

(defun cshart-mode-setup ()
  ;; indent
  (c-set-style "java")
  (setq tab-width 4)
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil)

  ;; etc
  (electric-pair-mode 1)

  ;; hook
  (add-hook 'before-save-hook 'my-csharp-before-save-hook))

(add-hook 'csharp-mode-hook 'csharp-mode-setup)
