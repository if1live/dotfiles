;; web-mode - template engine (etc, etc)
;; http://web-mode.org/
;; css / html
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
;; django / flask
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jinja2\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jinja\\'" . web-mode))
;; php
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; ruby / erb
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; javascript
(add-to-list 'auto-mode-alist '("\\.ejs" . web-mode))
;; etc
(add-to-list 'auto-mode-alist '("\\.scss?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))


(add-hook 'web-mode-hook
  (lambda ()
    ;; basic tab
    (setq-default indent-tabs-mode nil)
    (setq-default tab-width 2)
    ;; indent
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-attr-indent-offset 2)
    ;; left padding
    (setq web-mode-style-padding 2)
    (setq web-mode-script-padding 2)
    (setq web-mode-block-padding 0)
    ;; comment
    (setq web-mode-comment-style 2)))

;; Auto-pairs
(setq web-mode-extra-auto-pairs
      '(("erb" . (("beg" "end")))
        ("php" . (("beg" "end")
                  ("beg" "end")))
        ))
(setq web-mode-enable-auto-pairing t)
