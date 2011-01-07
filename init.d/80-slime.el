(require 'slime)
(set-language-environment "UTF-8")
(slime-setup (list 'slime-repl))
(require 'slime-fancy)
(slime-c-p-c-init)
(setq slime-net-coding-system 'utf-8-unix)
(add-hook 'clojure-mode-hook
          (lambda ()
            (slime-mode t)
            (local-set-key [tab] 'slime-indent-and-complete-symbol)
            ; M-C-;
            (local-set-key (quote [201326651]) 'slime-insert-balanced-comments)))
