;; http://jblevins.org/projects/markdown-mode/
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; 정적 사이트 생성기용 markdown 생성기 maya 때문에 추가한것
;; 템플릿의 확장자를 .md로 유지하면 pelican이 의도치않게 읽어버린다
(add-to-list 'auto-mode-alist '("\\.md.tpl$" . markdown-mode))

(add-hook 'markdown-mode-hook
  (lambda ()
    (setq markdown-coding-system 'utf-8)
    (setq tab-width 4)
    (setq indent-tabs-mode nil)))
