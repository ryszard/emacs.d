(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(let ((paredit-forward-backward (lambda ()
				  (progn
				    (local-set-key [s-right] 'paredit-forward)
				    (local-set-key [s-left] 'paredit-backward)))))
  (add-hook 'emacs-lisp-mode-hook paredit-forward-backward))


