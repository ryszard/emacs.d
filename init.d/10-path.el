(require 'cl)

(defun augment-path-like (var &rest paths)
  "Add `paths` to PATH-like environmental variable."
  (setenv var
	  (reduce (lambda (el ac)
		    (concat ac path-separator el))
		  (reverse paths)
		  :initial-value (getenv "PATH"))))

(defun augment-path (&rest paths)
  (apply 'augment-path-like (cons "PATH" paths)))


(when (equal system-type 'darwin)
 (augment-path
  "/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin"
  "/opt/local/bin"
  "/usr/local/bin")
(augment-path-like 
 "PYTHONPATH"
 "/opt/local/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/site-packages")
 (push "/opt/local/bin" exec-path))


