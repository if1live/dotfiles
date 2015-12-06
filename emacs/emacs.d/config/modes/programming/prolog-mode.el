;; perl을 쓰진 않을테니까 .pl을 Prolog로 변경
(add-to-list 'auto-mode-alist '("\\.pl$" . prolog-mode))

(defun my-prolog-before-save-hook ()
  (delete-trailing-whitespace))

(defun prolog-mode-setup ()
  (add-hook 'before-save-hook 'my-prolog-before-save-hook))

(add-hook 'prolog-mode-hook 'prolog-mode-setup)
