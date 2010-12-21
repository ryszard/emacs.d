(setq python-check-command "pyflakes")

;;; Functions for use in snippets
(defun python-class-name ()
  "Finds beginning of innermost nested class definition.
Returns the name of the definition found at the end, or nil if
reached start of buffer."
  (let ((def-re (rx line-start (0+ space) "class" (1+ space)
            (group (1+ (or word (syntax symbol))))))
    found)
    (while (and (python-beginning-of-block) (not found))
      (if (looking-at def-re)
      (setq found (match-string 1))))
    found))

(defun python-def-name ()
  "Finds beginning of innermost nested class definition.
Returns the name of the definition found at the end, or nil if
reached start of buffer."
  (let ((def-re (rx line-start (0+ space) "def" (1+ space)
            (group (1+ (or word (syntax symbol))))))
    found)
    (while (and (python-beginning-of-block) (not found))
      (if (looking-at def-re)
      (setq found (match-string 1))))
    found))