; inspired by slime.el. Look for inspiration to message arglist of
; function under point.
(defun elisp-indent-and-complete-symbol ()
  "Indent the current line and perform symbol completion.  First
indent the line. If indenting doesn't move point, complete the
symbol."
  (interactive)
  (let ((pos (point)))
    (lisp-indent-line)
    (when (and (= pos (point)) (save-excursion (re-search-backward "[^() \n\t\r]+\\=" nil t)))
      (unless (looking-at "[ (\n\t\r)]")
        (re-search-forward "[a-zA-Z-]+" nil t))
      (lisp-complete-symbol))))


;;;;; Find definition

(defvar *elisp-definition-stack*
  (make-ring 20))

(defun elisp-push-definition-stack ()
  "Push marker of current definition onto the stack."
  (ring-insert *elisp-definition-stack* (point-marker)))

(defun elisp-pop-definition-stack ()
  "Unless the definition stack is empty, switch to the last
buffer and point."
  (interactive)
  (unless (ring-empty-p *elisp-definition-stack*)
    (let* ((marker (ring-remove *elisp-definition-stack* 0))
           (buffer (marker-buffer marker))
           (point (marker-position marker)))
      (progn
        (switch-to-buffer buffer)
        (goto-char point)))))

(defun elisp-edit-definition ()
  "Lookup the definition of the name at point and switch to it."
  (interactive)
  (elisp-push-definition-stack)
  (or
   (find-function-do-it (function-called-at-point) nil (lambda (x) (switch-to-buffer x) t))
   (when (not (zerop (variable-at-point)))
    (find-function-do-it (variable-at-point) 'defvar (lambda (x) (switch-to-buffer x) t)))))


;;;;; Add-hook

(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (local-set-key [tab] 'elisp-indent-and-complete-symbol)
                                  (local-set-key "\M-." 'elisp-edit-definition)
                                  (local-set-key "\M-," 'elisp-pop-definition-stack)))
