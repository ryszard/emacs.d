(require 'git)

(defun git-review (task-number)
  (interactive "nTask number: ")
  (let* ((buffer (get-buffer-create "*Review*"))
         (dir (git-get-top-dir ".")))
    (switch-to-buffer buffer)
    (cd dir)
    (shell-command (format "git log -p --grep='#%d' --reverse" task-number)
                   buffer buffer)
    (diff-mode)))