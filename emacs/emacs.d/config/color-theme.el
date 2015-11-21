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
