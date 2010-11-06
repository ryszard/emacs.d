(defun split-window-vertically* ()
  "Vertically split window and move to the new buffer."
  (interactive)
  (let ((new-buffer (iswitchb-read-buffer "vsplit ")))
    (split-window-vertically)
    (other-window 1)
    (switch-to-buffer new-buffer)))


(defun split-window-horizontally* ()
  "Horizontaly split window and move to the new buffer."
  (interactive)
  (let ((new-buffer (iswitchb-read-buffer "hsplit ")))
    (split-window-horizontally)
    (other-window 1)
    (switch-to-buffer new-buffer)))

(global-set-key (kbd "C-x 2") 'split-window-vertically*)
(global-set-key (kbd " C-x 3") 'split-window-horizontally*)

;;; The following 2 functions are stolen from Steve Yegge and then
;;; changed a bit. See
;;; http://sites.google.com/site/steveyegge2/my-dot-emacs-file

(defun rename-file-and-buffer (new-name)
 "Renames both current buffer and file it's visiting to NEW-NAME." (interactive "FNew name: ")
 (let ((name (buffer-name))
       (filename (buffer-file-name)))
   (if (not filename)
       (message "Buffer '%s' is not visiting a file!" name)
     (if (get-buffer new-name)
	 (message "A buffer named '%s' already exists!" new-name)
       (progn
	 (rename-file name new-name 1)
 	 (rename-buffer new-name)
 	 (set-visited-file-name new-name)
 	 (set-buffer-modified-p nil))))))

(defun move-buffer-file (dir)
  "Moves both current buffer and file it's visiting to DIR." (interactive "DNew directory: ")
  (let* ((name (buffer-name))
	 (filename (buffer-file-name))
	 (dir (if (string-match dir "\\(?:/\\|\\\\)$") (substring dir 0 -1) dir))
	 (newname (concat dir "/" name)))

    (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
      (progn 
	(copy-file filename newname 1)
 	(delete-file filename)
 	(set-visited-file-name newname)
 	(set-buffer-modified-p nil)
 	t))))