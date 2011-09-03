;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;; Licence: GPL v3 or later

;;----------------------------------------------------------------------------
;; Handier way to add modes to auto-mode-alist
;;----------------------------------------------------------------------------
(defun add-auto-mode (mode &rest patterns)
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))


;;----------------------------------------------------------------------------
;; Find the directory containing a given library
;;----------------------------------------------------------------------------
(require 'find-func)
(defun directory-of-library (library-name)
  (file-name-as-directory (file-name-directory (find-library-name library-name))))


;;----------------------------------------------------------------------------
;; Easy way to check that we're operating on a specific file type
;;----------------------------------------------------------------------------
(defun filename-has-extension-p (extensions)
  (and buffer-file-name
       (string-match (concat "\\." (regexp-opt extensions t) "\\($\\|\\.\\)") buffer-file-name)))


;;----------------------------------------------------------------------------
;; Locate executables
;;----------------------------------------------------------------------------
(defun find-executable (name)
  "Return the full path of an executable file name `name'
in `exec-path', or nil if no such command exists"
  (locate-file name exec-path nil 'file-executable-p))


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
;; fixme highlight
;;----------------------------------------------------------------------------
(defun highlight-fixme ()
  (font-lock-add-keywords nil'(("\\<\\(FIXME!?\\)"
				1 font-lock-warning-face prepend))))

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

(defun yag/copyright ()
  "put copy right notice at the beginning of the buffer and comment it"
  (interactive)
  (save-excursion
    (goto-char 1)
    (let ((beg (point)))
      (insert
       "Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
Licence: GPL v3 or later

")
      (comment-region beg (point)))))


(provide 'init-utils)
