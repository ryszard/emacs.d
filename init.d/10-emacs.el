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

(setq enable-recursive-minibuffers t)
(setq ls-lisp-dirs-first t)
