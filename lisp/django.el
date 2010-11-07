(require 'compile)

(defvar django-tests-env-vars "FASTER=t")

(defun get-file-in-upstream-dir (location filename &optional stop-condition)
  (let* ((dir (file-name-directory location))
         (path (concat dir filename))
	 (stop-condition (or stop-condition (lambda (d) (equal d "/")))))
    (if (file-exists-p path)
        path
      (if (not (funcall stop-condition dir))
        (get-file-in-upstream-dir (expand-file-name (concat dir "../")) filename)))))

(defun django-project-root (&optional from)
  "Find the root of of the Django project we are currently
in (looking for settings.py). If FROM is provided, start looking
from there."
  (let ((manage (get-file-in-upstream-dir (or from (buffer-file-name)) "manage.py"))) 
    (if manage 
	(file-name-directory manage)
      (read-directory-name "Django project: "))))


(define-compilation-mode django-tests-mode "Django tests"
  "Django testing compilation mode."
  nil)

(defun django-find-current-app (&optional from)
  (let ((ud 
	 (get-file-in-upstream-dir (or from (buffer-file-name)) 
				   "models.py" 
				   (lambda (d) 
				     (file-exists-p (concat d "settings.py"))))))
    (when ud
      (first (last (split-string (file-name-directory ud) "/" t))))))

(defun django-tests-build-command ()
  (let ((current-app (django-find-current-app)))
   (cd (django-project-root))
   (format "%s ./manage.py test %s" django-tests-env-vars (or current-app ""))))

;;;###autoload
(defun django-tests (command-args)
  "Run Django tests."
  (interactive
   (list 
    
    (read-from-minibuffer "Run django tests (like this): "
			       (django-tests-build-command)
			       nil
			       nil
			       'django-tests-history)))
  (compilation-start 
   command-args
   'django-tests-mode))

(add-hook 'python-mode-hook
	  (lambda ()
	    (local-set-key (kbd "\C-c\C-c") 'django-tests)))

(provide 'django)

