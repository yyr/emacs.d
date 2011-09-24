;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
;; License: GPL v3 or later

;;----------------------------------------------------------------------------
;; Find the directory containing a given library
;;----------------------------------------------------------------------------
(require 'find-func)
(defun directory-of-library (library-name)
  "open directory with dired which contains the give library"
  (interactive "M")
  (dired (file-name-as-directory
          (file-name-directory (find-library-name library-name)))))

;;----------------------------------------------------------------------------
;; Delete the current file
;;----------------------------------------------------------------------------
(defun delete-this-file ()
  (interactive)
  (or (buffer-file-name) (error "no file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))

;;----------------------------------------------------------------------------
;; Browse current HTML file
;;----------------------------------------------------------------------------
(defun browse-current-file ()
  (interactive)
  (browse-url (concat "file://" (buffer-file-name))))

;;----------------------------------------------------------------------------
;; date insert with arg
;;----------------------------------------------------------------------------
(defun insert-date (arg)
  "Insert date at point.
With prefix argument, insert date and time."
  (interactive "P")
  (insert (format-time-string "%Y-%m-%d"))
  (when arg
    (insert (format-time-string " %H:%M"))))
;; (global-set-key (kbd "C-c d") 'insert-date)

;;----------------------------------------------------------------------------
;; transpose buffers
;;----------------------------------------------------------------------------
(defun transpose-buffers (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

(global-set-key (kbd "C-<f7>") 'transpose-buffers)


;;----------------------------------------------------------------------------
;; delete leading white spaces from emacswiki
;;----------------------------------------------------------------------------
(defun my-delete-leading-whitespace (start end)
  "Delete whitespace at the beginning of each line in region."
  (interactive "*r")
  (save-excursion
    (if (not (bolp)) (forward-line 1))
    (delete-whitespace-rectangle (point) end nil)))

;; brent henson, norang.org
(defun yag/switch-to-scratch ()
  "switch to scratch , take if region is active"
  (interactive)
  (let ((contents
         (and (region-active-p)
              (buffer-substring (region-beginning)
                                (region-end)))))
    (switch-to-buffer "*scratch*")
    (if contents
        (progn
          (goto-char (buffer-end 1))
          (insert contents)))))

;;; put copyright notice on top of the file;(watches for shebang also)
(defun yag/copyright ()
  "put copy right notice at the beginning of the buffer and comment it"
  (interactive)
  (save-excursion
    (let ((beg (point))
          (notice  "Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
License: GPL v3 or later

"))
      (goto-char 1)
      ;; watch out if shebang is present
      (if (string-match "#!"  (thing-at-point 'line))  
          (next-line))
      (setq beg (point))
      (insert   notice)
      (comment-region beg (point)))))

;;; FIXME: put that asynchronous
(defun gnome-open ()
  "open file buffer with gnome associated program"
  (interactive)
  (let ((bname  (buffer-file-name)))
    (if bname
        (shell-command (concat "gnome-open" " " (expand-file-name bname)))
      (message "No associated buffer exist for \"%s\" buffer "
               (buffer-name)))))

(provide 'init-utils)
;;; init-utils-el ends here
