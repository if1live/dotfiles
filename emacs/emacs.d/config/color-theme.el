;; color-theme
;; 2014-09-19 기준으로 el-get + color-theme가 먹히지 않는다
;; 원인은 color-theme의 기본 저장소인
;; http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.zip
;; 를 받을수 없기 때문인것으로 보인다. (Index는 접근되면서 파일받기는 안된다니...)
;; 그래서 따로 구해서 저장소에 때려박았다.
;; 사용된 코드 : https://github.com/jwiegley/color-theme
(add-to-list 'load-path "~/.emacs.d/ext/color-theme")
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
