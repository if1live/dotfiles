;; default indent
;; http://emacswiki.org/emacs/IndentingC
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq tab-stop-list (number-sequence 4 200 4))
(setq indent-line-function 'insert-tab)
(setq lisp-body-indent 2)
(setq c-default-style "stroustrup")
(setq c-basic-offset 4)

;; new lines at the end
(setq next-line-add-newlines t)


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

;;(defun no-dos-please-were-unixish ()
;;  (let ((coding-str (symbol-name buffer-file-coding-system)))
;;    (when (string-match "-dos$" coding-str)
;;      (setq coding-str
;;            (concat (substring coding-str 0 (match-beginning 0)) "-unix"))
;;      (message "CODING: %s" coding-str)
;;      (set-buffer-file-coding-system (intern coding-str)))))
;;(add-hook 'find-file-hooks 'no-dos-please-were-unixish)


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

;;;;;;
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
;; // vcs
;;;;;;;;;
