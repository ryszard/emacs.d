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

(define-compilation-mode django-manage-py-mode "Django manage.py"
  "Django manage.py compilation mode."
  nil)


(defun django-find-current-app (&optional from)
  (when-let (ud 
	     (get-file-in-upstream-dir 
	      (or from (buffer-file-name)) 
	      "models.py" 
	      (lambda (d) 
		(file-exists-p (concat d "settings.py")))))
	    
	    (first (last (split-string (file-name-directory ud) "/" t)))))
(django-find-current-app)

(defmacro define-manage-py (name prompt &rest body)
  `(progn
     (defun ,name (command-args)
       "Run Django tests."
       (interactive
	(list 
	 (format 
	  "cd %s; %s"
	  (django-project-root)
	  (read-from-minibuffer 
	   ,prompt
	   (progn ,@body)
	   nil
	   nil
	   ',(make-symbol (format "django-%s-history" name))))))
       (compilation-start 
	command-args
	'django-manage-py-mode))
     (autoload ',name ,(buffer-file-name))))

(define-manage-py django-tests "Run django test (like this): "
  (format "%s ./manage.py test %s" 
	  django-tests-env-vars 
	  (or (django-find-current-app) "")))

(add-hook 'python-mode-hook
	  (lambda ()
	    (local-set-key (kbd "\C-c\C-c") 'django-tests)))

(provide 'django)

