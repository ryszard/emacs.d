(push (expand-file-name "~/.emacs.d/lisp") load-path)

(let* ((lisp-directory (expand-file-name "~/.emacs.d/lisp"))
       (default-directory lisp-directory))
  (push lisp-directory load-path)
  (normal-top-level-add-subdirs-to-load-path))
