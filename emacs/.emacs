(custom-set-variables
 ;; Show column number on the status line
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(show-paren-mode t))

;; 윈도우 + 나눔고딕코딩
(custom-set-faces
 '(default ((t (
    :family "NanumGothicCoding"
    :foundry "outline"
    :slant normal
    :weight normal
    :height 143
    :width normal)))))

;; reference
;; http://dotfiles.org/~battlemidget/.emacs

;; 리눅스 한글 설정: 나눔고딕코딩
;; http://kiros33.blog.me/130138066686
(if (eq system-type 'gnu/linux)
    (progn
      (set-fontset-font "fontset-default"
                        'korean-ksc5601
                        "-unknown-NanumGothicCoding-normal-normal-normal-*-*-*-*-*-d-0-iso10646-1")
      (setq initial-frame-alist '((top . 10) (left . 100)))))

;; 한영키 바꿔치기. 콘솔에서는 필요없지만 GUI사용할때 대비
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(global-set-key (kbd "<S-kana>") 'toggle-input-method)
(global-set-key (kbd "<kana>") 'toggle-input-method)

;; Alt-F4 = quit
(global-set-key (kbd "<M-f4>") 'save-buffers-kill-terminal)

;; set basic emacs mode path
(add-to-list 'load-path "~/.emacs.d/")

;; el-get setting
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; installed el-get package list
;; jinja2-mode
;; yaml-mode
;; scheme-complete
;; coffee-mode
;; color-theme
;; rainbow-delimiters
;; jedi
;; markdown-mode
;; rst-mode
;; twittering-mode

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

;; http://stackoverflow.com/questions/8246483/emacs-how-to-disable-files-creation
(setq auto-save-file-name-transforms
    `((".*" ,temporary-file-directory t)))


;; http://www.emacswiki.org/emacs/DeletingWhitespace
;; do not use global scope before-save-hook.
;; because in markdown, trailing two spaces means newline.
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
;; detect major mode
;; http://stackoverflow.com/questions/6312202/detect-current-major-mode-in-emacs-from-lisp
(defvar delete-trailing-whitespace-language-list
  (list
    'lisp-mode
    'emacs-lisp-mode
    'python-mode
    'html-mode
    'scheme-mode
    'php-mode
    'js-mode
    'coffee-mode
    'c-mode
    'c++-mode
    'latex-mode))
(defun my-delete-trailing-whitespace()
  (if (member major-mode delete-trailing-whitespace-language-list)
    (delete-trailing-whitespace)))
(add-hook 'before-save-hook 'my-delete-trailing-whitespace)

;; color settings
;; 2014-09-19 기준으로 gl-get + color-theme가 먹히지 않는다
;; 원인은 color-theme의 기본 저장소인
;; http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.zip
;; 를 받을수 없기 때문인것으로 보인다. (Index는 접근되면서 파일받기는 안된다니...)
;; 그래서 따로 구해서 저장소에 때려박았다.
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)

(defun set-color-theme-dispatch-platform ()
  (if (eq system-type 'windows-nt)
    ;; for windows
    (color-theme-euphoria)
    ;; other platform, like linux console + putty
    (color-theme-lethe)))
(set-color-theme-dispatch-platform)

;;(color-theme-dark-laptop)
;;(color-theme-arjen)
;;(color-theme-hober)
;; for window color
;;(color-theme-clarity)
;; for linux console color
;;(color-theme-digital-ofs1)


;; new lines at the end
(setq next-line-add-newlines t)

;; raindow-delimiters
(require 'rainbow-delimiters)
;; enable in all programming-related modes
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; default indent
;; http://emacswiki.org/emacs/IndentingC
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq tab-stop-list (number-sequence 4 200 4))
(setq indent-line-function 'insert-tab)
(setq lisp-body-indent 2)
(setq c-default-style "stroustrup")
(setq c-basic-offset 4)

;; lisp
(add-hook 'lisp-mode-hook
  (lambda ()
    (set (make-local-variable 'lisp-indent-function)
         'common-lisp-indent-function)))

;; Python Hook
(add-hook 'python-mode-hook '(lambda ()
  (setq python-indent 4)))


;; emacs lisp
;; http://www.emacswiki.org/emacs/EmacsLispMode
(add-hook 'emacs-lisp-mode-hook
  (lambda ()
    (setq tab-witth 2)
    ;; Use spaces, not tabs.
    (setq indent-tabs-mode nil)
    (put 'add-hook 'lisp-indent-function 1)
    (put 'function 'lisp-indent-function 2)))

;; scheme
(add-hook 'scheme-mode-hook
  (lambda ()
    (setq tab-width 2)
    (setq indent-tabs-mode nil)))
(add-to-list 'auto-mode-alist '("\\.rkt" . scheme-mode))


;; HTML
(add-hook 'html-mode-hook
  (lambda ()
    (setq tab-width 2)
    (setq sgml-basic-offset 2)
    (setq indent-tabs-mode nil)
    ;; Default indentation is usually 2 spaces, changing to 4.
    (set (make-local-variable 'sgml-basic-offset) 4)))
(add-to-list 'auto-mode-alist '("\\.ejs" . html-mode))


;; nxml indent
;; http://www.dpawson.co.uk/relaxng/nxml/nxmlGeneral.html#d357e432
(setq nxml-child-indent 4)


;; PHP setting
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(setq php-mode-force-pear t)
(add-hook 'php-mode-hook
  (lambda ()
    (setq c-default-style "stroustrup")
    (setq indent-tabs-mode nil)
    (setq tab-width 4)
    (setq c-basic-indent 4)))


;; javascript
(add-hook 'js-mode-hook
  (lambda ()
    (setq-default indent-tabs-mode nil)
    (setq-default tab-width 2)
    (setq js-indent-level 2)
    (setq default-tab-width 2)
    (setq tab-stop-list (number-sequence 2 200 2))))

;; coffeescript
(add-hook 'coffee-mode-hook
  (lambda ()
    ;; automatically clean up bad whitespace
    (setq whitespace-action '(auto-cleanup))
    ;; only show bad whitespace
    (setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
    ;; This gives you a tab of 2 spaces
    (setq coffee-tab-width 2)))

;; matlab
;; http://www.emacswiki.org/MatlabMode
(add-to-list 'load-path "~/.emacs.d/matlab-emacs")
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
  'auto-mode-alist
  '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")

;; markdown
;; http://jblevins.org/projects/markdown-mode/
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(add-hook 'markdown-mode-hook
  (lambda ()
    (setq markdown-coding-system 'utf-8)
    (setq-default tab-width 4)
    (setq-default indent-tabs-mode nil)))


;; vcs
(setq
  ;; don't show annoing startup msg
  inhibit-startup-message t
  ;; NO annoing backups
  make-backup-files nil
  ;; make sure file ends with NEWLINE
  require-final-newline t
  ;; follow symlinks and don't ask
  vc-follow-symlinks t
  ;; display time in the modeline
  display-time-24hr-format t
  display-time-day-and-date t)


;; jedi - python ide
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional


;; twittering-mode
(setq twittering-use-master-password t)
(twittering-enable-unread-status-notifier)
