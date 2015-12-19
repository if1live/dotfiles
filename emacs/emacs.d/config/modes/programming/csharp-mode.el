(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(add-to-list 'auto-mode-alist '("\\.cs" . csharp-mode))

(defun csharp-mode-setup ()
  ;; indent
  (c-set-style "c#")
  (setq tab-width 4)
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil)

  ;; etc
  (electric-pair-mode 1)

  ;; hook
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(add-hook 'csharp-mode-hook 'csharp-mode-setup)
