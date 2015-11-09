;;;;;;;
;; Font
;; 윈도우 + 나눔고딕코딩
(custom-set-faces
 '(default ((t (
                :family "NanumGothicCoding"
                        :foundry "outline"
                        :slant normal
                        :weight normal
                        :height 143
                        :width normal)))))

;; 리눅스 한글 설정: 나눔고딕코딩
;; http://kiros33.blog.me/130138066686
(if (eq system-type 'gnu/linux)
    (progn
      (set-fontset-font "fontset-default"
                        'korean-ksc5601
                        "-unknown-NanumGothicCoding-normal-normal-normal-*-*-*-*-*-d-0-iso10646-1")
      (setq initial-frame-alist '((top . 10) (left . 100)))))
;; // Font
;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hangul/Encoding Environment
;; 한영키 바꿔치기. 콘솔에서는 필요없지만 GUI사용할때 대비
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(global-set-key (kbd "<S-kana>") 'toggle-input-method)
(global-set-key (kbd "<kana>") 'toggle-input-method)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
