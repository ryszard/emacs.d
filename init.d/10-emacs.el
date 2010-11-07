(setq inhibit-splash-screen t)

(setq mac-function-modifier  'meta)
(scroll-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(set-default-font "-apple-Monaco-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1")


(defun maximize-frame () 
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 1000 1000))

(global-set-key (kbd "<s-S-return>") 'maximize-frame)
(maximize-frame)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; paste at point:
(setq mouse-yank-at-point t)
(setq mouse-wheel-scroll-amount '(0.01))

(global-font-lock-mode t)
(partial-completion-mode t)

;; imenu
(global-set-key [(super return)] 'imenu)

;; history

(setq savehist-file "~/.emacs.d/.savehist")
(savehist-mode 1)

;; save places in visited files
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/.saveplace")
(require 'saveplace)

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
