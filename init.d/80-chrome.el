(require 'edit-server)
(edit-server-start)
(setq edit-server-done-hook 
      (lambda ()
	(shell-command "open -a 'Google Chrome'")))
