;; http://www.emacswiki.org/MatlabMode
(add-to-list 'load-path "~/.emacs.d/matlab-emacs")
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
 'auto-mode-alist
 '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")
