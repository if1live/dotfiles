;; http://emacs.stackexchange.com/questions/12396/run-command-when-opening-a-file-of-a-specific-filetype
(add-hook 'find-file-hook 'my-project-hook)

(defun my-project-hook()
  (let ((path-token-list (split-string buffer-file-name "/")))
    (if (member "shinozaki" path-token-list) (shinozaki-project-hook))))

(defun shinozaki-project-hook()
  (when (string= (file-name-extension buffer-file-name) "jinja2")
    (setq web-mode-markup-indent-offset 4)))
