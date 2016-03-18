(color-theme-initialize)

;; https://github.com/sellout/emacs-color-theme-solarized/issues/167
(defun set-solarized-light ()
  (interactive)
  (customize-set-variable 'frame-background-mode 'light)
  (load-theme 'solarized t))

(defun set-solarized-dark ()
  (interactive)
  (customize-set-variable 'frame-background-mode 'dark)
  (load-theme 'solarized t))
	
(defun set-color-theme-dispatch-platform ()
  (if (eq system-type 'windows-nt)
      ;; for windows
	  (color-theme-arjen)
      ;; other platform, like linux console + putty
      (color-theme-lethe)))
	  
(set-color-theme-dispatch-platform)

;;(color-theme-euphoria)
;;(color-theme-dark-laptop)
;;(color-theme-arjen)
;;(color-theme-hober)
;; (color-theme-solarized)
;; for window color
;;(color-theme-clarity)
;; for linux console color
;;(color-theme-digital-ofs1)