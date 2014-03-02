(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(current-language-environment "UTF-8")
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "나눔고딕코딩" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))

;; 리눅스 한글 설정: 나눔고딕코딩
;; http://kiros33.blog.me/130138066686
(if (eq system-type 'gnu/linux)
    (progn
        (set-fontset-font "fontset-default" 'korean-ksc5601 "-unknown->나눔고딕코딩-normal-normal-normal-*-*-*-*-*-d-0-iso10646-1")
        (setq initial-frame-alist '((top . 10) (left . 100)))
    )
)


;; 한영키 바꿔치기. 콘솔에서는 필요없지만 GUI사용할때 대비
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)
(global-set-key (kbd "<S-kana>") 'toggle-input-method)
(global-set-key (kbd "<kana>") 'toggle-input-method)

;; set basic emacs mode path
(add-to-list 'load-path "~/.emacs.d/")

;; http://www.emacswiki.org/emacs/EndOfLineTips
(defun unix-file ()
        "Change the current buffer to Latin 1 with Unix line-ends."
        (interactive)
        (set-buffer-file-coding-system 'utf-8-unix t))
(defun dos-file ()
        "Change the current buffer to Latin 1 with DOS line-ends."
        (interactive)
        (set-buffer-file-coding-system 'utf-8-dos t))
(defun mac-file ()
        "Change the current buffer to Latin 1 with Mac line-ends."
        (interactive)
        (set-buffer-file-coding-system 'utf-8-dos t))

(defun no-dos-please-were-unixish ()
        (let ((coding-str (symbol-name buffer-file-coding-system)))
                (when (string-match "-dos$" coding-str)
                        (setq coding-str
                        (concat (substring coding-str 0 (match-beginning 0)) "-unix"))
                (message "CODING: %s" coding-str)
                (set-buffer-file-coding-system (intern coding-str)) )))
(add-hook 'find-file-hooks 'no-dos-please-were-unixish)
