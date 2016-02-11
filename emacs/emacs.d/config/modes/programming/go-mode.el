;; http://andrewjamesjohnson.com/configuring-emacs-for-go-development/

(defun my-go-before-save-hook ()
  (gofmt-before-save)
  (delete-trailing-whitespace))

(defun go-mode-setup ()
  (setq tab-width 4)
  (setq indent-tabs-mode 1)

  ;; https://github.com/nsf/gocode/tree/master/emacs-company
  ;; auto complete
  (setq company-tooltip-limit 20)                      ; bigger popup window
  (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
  (setq company-echo-delay 0)                          ; remove annoying blinking
  (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)

  ;; goimport
  (setq gofmt-command "goimports")

  ;; go get -u github.com/golang/lint/golint
  ;; TODO global go path?
  ;;(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))
  ;;(require 'golint)

  ;; keyboard
  (local-set-key (kbd "M-.") 'godef-jump)
  (define-key (current-local-map) "\C-c\C-c" 'compile)

  ;; hook
  (add-hook 'before-save-hook 'my-go-before-save-hook)
  (setq compile-command "go build -v && go test -v && go vet")

  (go-eldoc-setup))

(add-hook 'go-mode-hook 'go-mode-setup)
