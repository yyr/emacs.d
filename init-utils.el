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
  (interactive "p")
  (if (= arg 16)
      (insert (format-time-string "%A, %B %e %Y" (current-time)))
    (progn
      (insert (format-time-string "%Y-%m-%d"))
      (when arg
        (insert (format-time-string " %H:%M"))))))

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

;;; closing chars
(defconst default-closing-char ";"
  "default closing char, change in newline-force-close-alist if needed")

(setq newline-force-close-alist
      '((python-mode . ":")
        (prolog-mode . ".")
        (latex-mode . " \\\\")
        (html-mode . " <br>")))

(defun newline-force()
  "Goes to newline leaving untouched the rest of the line"
  (interactive)
  (progn
    (end-of-line)
    (newline-and-indent)))

(defun newline-force-close()
  (interactive)
  (end-of-line)
  (let ((closing-way (assoc major-mode newline-force-close-alist))
        closing-char)
    ;; Setting the user defined or the constant if not found
    (if (not closing-way)
        (progn
          (message "closing char not defined for this mode, using default")
          (setq closing-char default-closing-char))
      (setq closing-char (cdr closing-way)))
    (when (not (bobp))
      ;; if we're at beginning of buffer, the backward-char will beep
      ;; :( This works even in the case of narrowing (e.g. we don't
      ;; look outside of the narrowed area.
      (when (not (looking-at closing-char))
        (insert closing-char))
      (newline-force))))

(global-set-key (kbd "M-RET") 'newline-force)
(global-set-key [M-S-return] 'newline-force-close)

(defun ca-with-comment (str)
  (format "%s%s%s" comment-start str comment-end))

(defun ca-all-asscs (asslist query)
  "returns a list of all corresponding values (like rassoc)"
  (cond
   ((null asslist) nil)
   (t
    (if (equal (cdr (car asslist)) query)
        (cons (car (car asslist)) (ca-all-asscs (cdr asslist) query))
      (ca-all-asscs (cdr asslist) query)))))

;;; ----
(defun shell-command-on-buffer-file ()
  "prompts for a command and executes that command on to the associated
 file of current buffer. if no buffer is associated gives an error"
  (interactive)
  (or (buffer-file-name) (error "no file is associated file to this buffer"))
  (let* ((my-cmd (read-shell-command "Command to run: "))
         (cmd-to-run (concat my-cmd " " (buffer-file-name))))
    (shell-command cmd-to-run)))


;;; init-utils-el ends here
