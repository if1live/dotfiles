;; c-lang-defconst .. 관련 문제 발생시 ~/.emacs.d/ 를 다시 컴파일해보자
;; http://stackoverflow.com/questions/1217180/
;; C-u 0 M-x byte-recompile-directory

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

  (setq omnisharp-server-executable-path "~/bin/omnisharp/OmniSharp")

  ;; hook
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(add-hook 'csharp-mode-hook 'csharp-mode-setup)
(add-hook 'csharp-mode-hook 'omnisharp-mode)
