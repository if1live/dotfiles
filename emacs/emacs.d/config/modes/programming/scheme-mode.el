(add-hook 'scheme-mode-hook
  (lambda ()
    (setq tab-width 2)
    (setq indent-tabs-mode nil)))
(add-to-list 'auto-mode-alist '("\\.rkt" . scheme-mode))

;; scheme-complete
;; 2014-12-31 기준으로 el-get + scheme-complete가 먹히지 않는다.
;; 그래서 외부 저장소 이용
(add-to-list 'load-path "~/.emacs.d/ext/scheme-complete")
