(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path))
(setenv "PATH" (concat "/usr/local/bin" path-separator (getenv "PATH")))

