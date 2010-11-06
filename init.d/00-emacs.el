(setq inhibit-splash-screen t)

(setenv "PATH" (concat "/usr/local/bin" path-separator (getenv "PATH")))

(setq mac-function-modifier  'meta)


(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(mouse-wheel-follow-mouse t)
 '(mouse-wheel-mode t)
 '(ns-pop-up-frames nil)
 '(paren-match-face (quote paren-face-match))
 '(paren-sexp-mode t)
 '(show-paren-mode t))
