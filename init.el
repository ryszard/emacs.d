(dolist (f (directory-files "~/.emacs.d/init.d" t "^[^.,].*\\.el$"))
  (load-file f))
