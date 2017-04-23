;; Alt-F4 = quit
(global-set-key (kbd "<M-f4>") 'save-buffers-kill-terminal)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; tmux에서 ctrl-b를 그대로 쓰고싶다
;; 그래서 기본 단축키 제거
(dolist (key '("\C-b"))
  (global-unset-key key))
