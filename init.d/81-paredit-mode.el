(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(let ((paredit-forward-backward (lambda ()
				  (progn
				    (local-set-key [s-right] 'paredit-forward-slurp-sexp)
				    (local-set-key [s-left] 'paredit-forward-barf-sexp)
				    (local-set-key [m-s-right] 'paredit-forward)
				    (local-set-key [m-s-left] 'paredit-backward)))))
  (add-hook 'emacs-lisp-mode-hook paredit-forward-backward))


