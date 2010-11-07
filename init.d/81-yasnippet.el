(require 'yasnippet)
(yas/initialize)

(setq yas/snippet-dirs 
      (list 
       "~/.emacs.d/snippets"
       "~/.emacs.d/lisp/yasnippet/snippets"))

(yas/load-snippet-dirs)