;; http://andrewjamesjohnson.com/configuring-emacs-for-go-development/

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(defun my-go-before-save-hook ()
  (gofmt-before-save)
  (delete-trailing-whitespace))

(defun go-mode-setup ()
  (add-hook 'before-save-hook 'my-go-before-save-hook)
  (setq compile-command "go build -v && go test -v && go vet")
  (define-key (current-local-map) "\C-c\C-c" 'compile)
  (go-eldoc-setup)
  (setq gofmt-command "goimports")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (local-set-key (kbd "M-.") 'godef-jump))

(add-hook 'go-mode-hook 'go-mode-setup)
