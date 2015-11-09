;; http://stackoverflow.com/questions/6453955/how-do-i-prevent-emacs-from-adding-coding-information-in-the-first-line
(setq ruby-insert-encoding-magic-comment nil)
;; http://stackoverflow.com/questions/7404816/emacs-ruby-mode-indenting-wildly-inside-parentheses
(setq ruby-deep-indent-paren nil)
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile.lock$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("rakefile\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\.gemspec$" . ruby-mode))
