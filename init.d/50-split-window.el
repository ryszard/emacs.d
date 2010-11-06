(defun split-window-vertically* ()
  (interactive)
  (let ((new-buffer (iswitchb-read-buffer "vsplit ")))
    (split-window-vertically)
    (other-window 1)
    (switch-to-buffer new-buffer)))


(defun split-window-horizontally* ()
  (interactive)
  (let ((new-buffer (iswitchb-read-buffer "hsplit ")))
    (split-window-horizontally)
    (other-window 1)
    (switch-to-buffer new-buffer)))

(global-set-key (kbd "C-x 2") 'split-window-vertically*)
(global-set-key (kbd " C-x 3") 'split-window-horizontally*)

