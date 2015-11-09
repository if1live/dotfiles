;; Alt-F4 = quit
(global-set-key (kbd "<M-f4>") 'save-buffers-kill-terminal)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
