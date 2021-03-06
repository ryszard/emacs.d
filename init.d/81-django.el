;; run Django shell when editing Django Python code

(require 'django)
(defadvice run-python (before possibly-setup-django-project-environment)
  (let* ((settings-py (get-file-in-upstream-dir buffer-file-name "settings.py"))
         (project-dir (file-name-directory settings-py))
	 (local-site-python (get-file-in-upstream-dir buffer-file-name "site-python")))
    ;; TODO: do the right thing when ther's only `project-dir` or
    ;; `local-site-python` available.
    (when (and local-site-python settings-py)
        (progn
          (setenv "DJANGO_SETTINGS_MODULE" "settings")
          (setenv "PYTHONPATH" (format "%s:%s" local-site-python project-dir))))))
