;; raindow-delimiters
(require 'rainbow-delimiters)
;; enable in all programming-related modes
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; // rainbow-delemiters

;; company-mode
(add-hook 'after-init-hook 'global-company-mode)
