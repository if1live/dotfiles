(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(current-language-environment "UTF-8")
 '(safe-local-variable-values (quote ((encoding . utf-8)))))

;; 리눅스 한글 설정: 나눔고딕코딩
;; http://kiros33.blog.me/130138066686
(if (eq system-type 'gnu/linux)
  (progn
    (set-fontset-font "fontset-default" 'korean-ksc5601 "-unknown-NanumGothicCoding-normal-normal-normal-*-*-*-*-*-d-0-iso10646-1")
    (setq initial-frame-alist '((top . 10) (left . 100)))))

;; 한영키 바꿔치기. 콘솔에서는 필요없지만 GUI사용할때 대비
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)
(global-set-key (kbd "<S-kana>") 'toggle-input-method)
(global-set-key (kbd "<kana>") 'toggle-input-method)

;; set basic emacs mode path
(add-to-list 'load-path "~/.emacs.d/")

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

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
    (set-buffer-file-coding-system (intern coding-str)))))
(add-hook 'find-file-hooks 'no-dos-please-were-unixish)


;; not use emacs backup file
;; http://stackoverflow.com/questions/2680389/how-to-remove-all-files-ending-with-made-by-emacs
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
)

;; http://www.emacswiki.org/emacs/DeletingWhitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; color settings
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-dark-laptop)
;(color-theme-euphoria)
;(color-theme-arjen)
;(color-theme-lethe)
;; for window color
;(color-theme-clarity)
;; for linux console color
;;(color-theme-digital-ofs1)


;; default indent
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq tab-stop-list (number-sequence 4 200 4))
(setq indent-line-function 'insert-tab)


;; HTML
(add-hook 'html-mode-hook
  (lambda ()
    (setq tab-width 2)
    (setq sgml-basic-offset 2)
    (setq indent-tabs-mode nil)))
(add-to-list 'auto-mode-alist '("\\.ejs" . html-mode))


;; javascript
(add-hook 'js-mode-hook
  (function (lambda ()
    (setq-default indent-tabs-mode nil)
    (setq-default tab-width 2)
    (setq js-indent-level 2)
    (setq default-tab-width 2)
    (setq tab-stop-list (number-sequence 2 200 2)))))

;; coffeescript
;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
;; This gives you a tab of 2 spaces
(custom-set-variables '(coffee-tab-width 2))

