;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; License: GPL v3 or later

;;----------------------------------------------------------------------------
;; stupid debugger assistant
(defmacro my-debugger-on (&optional pkg)
  "Find out who is loading a PKG if the argument is available or
mark a check point"
  (setq debug-on-error t)
  (if pkg
      (eval-after-load pkg `(error ,pkg " is just loaded"))
    (message "%s" "I am here")))

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

;;; -----
(defun delete-leading-whitespace (start end)
  "Delete whitespace at the beginning of each line in region."
  (interactive "*r")
  (save-excursion
    (goto-char (point-min))
    (if (not (bolp)) (forward-line 1))
    (delete-whitespace-rectangle (point) end nil))
  (widen))

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

;;; --------------------------------------------------------------------
(defun shell-command-on-buffer-file ()
  "prompts for a command and executes that command on to the associated
 file of current buffer. if no buffer is associated gives an error"
  (interactive)
  (or (buffer-file-name) (error "no file is associated file to this buffer"))
  (let* ((my-cmd (read-shell-command "Command to run: "))
         (cmd-to-run (concat my-cmd " " (buffer-file-name))))
    (shell-command cmd-to-run)))


;; highlight-sloppy-grammar
;; ------------------------
;; This uses the font lock mechanism to highlight some potential
;; grammatical trouble spots.  It checks against a small list of common
;; problems such as duplicate words and instances of the passive voice.
;; It's not fool-proof but it does help when taking a pass over a paper.
;;
(defun highlight-sloppy-grammar ()
  "Highlight areas potentially containing sloppy grammar."
  (interactive)
  (make-face 'grammar-warning-face "Face to display grammar warnings in.")
  (face-spec-set 'grammar-warning-face
                 '((t (:bold t :foreground "orange" :underline t))))
  (font-lock-add-keywords
   nil
   '(("\\<\\(?:were\\|was\\|is\\|are\\|has been\\|be\\)\\(?:[ \t\r\n]+[a-zA-Z]+\\)?[ \t\r\n]+[a-zA-Z]+ed\\>"
      0 'grammar-warning-face t)        ; passive voice
     ("\\<\\([a-zA-Z]+\\)[ \t\r\n]+\\1\\>" 0 'grammar-warning-face t)
     ("[,-][ \t\r\n]+that\\>" 0 'grammar-warning-face t)
     ("[a-zA-Z]+[ \t\r\n]+which\\>" 0 'grammar-warning-face t)
     ("\\<[a-z]+\\(?:n't\\|d've\\)\\>" 0 'grammar-warning-face t)
     ("\\<by[ \t\r\n]+[a-z]+ing\\>" 0 'grammar-warning-face t)
     ("\\<which[ \t\r\n]+was\\>" 0 'grammar-warning-face t)
     ("\\<the[ \t\r\n]+[a-zA-Z]+[ \t\r\n]+of[ \t\r\n]+the\\>" 0
      'grammar-warning-face t)))
  (font-lock-fontify-buffer))

;;; Eric Schulte posted this in emacs-devel list
(defun cat-command ()
  "A command for cats."
  (interactive)
  (require 'animate)
  (let ((mouse "
           ___00
        ~~/____'>
          \"  \"")
        (h-pos (floor (/ (window-height) 2)))
        (contents (buffer-string))
        (mouse-buffer (generate-new-buffer "*mouse*")))
    (save-excursion
      (switch-to-buffer mouse-buffer)
      (insert contents)
      (setq truncate-lines t)
      (animate-string mouse h-pos 0)
      (dotimes (_ (window-width))
        (sit-for 0.02)
        (dotimes (n 3)
          (goto-line (+ h-pos n 2))
          (move-to-column 0)
          (insert " "))))
    (kill-buffer mouse-buffer)))

(defun toggle-debugger ()
  "alternative to stupid `toggle-debug-on-error'"
  (interactive)
  (if debug-on-error
      (progn
        (setq debug-on-error nil)
        (message "Debug on Error disabled globally"))
    (progn
      (setq debug-on-error t)
      (message "Debug on Error enabled globally"))))

(defun yyr-insert-filename (&optional arg)
  "insert file name sans extension at point. with ARG insert dired"
  (interactive "P")
  (insert (format "%s" (file-name-sans-extension
                        (file-name-nondirectory (buffer-file-name))))))

(defun save-in-tmp-dir ()
  "save current buffer in tmp folder"
  (interactive)
  (let* ((bn (buffer-name))
         (fn (concat (file-name-directory "~/tmp/") bn)))
    (write-file fn)))

(global-set-key (kbd "C-x w") 'save-in-tmp-dir)

;;; https://github.com/rejeep/emacs/blob/master/rejeep-defuns.el#L150-L158
(defun join-line-or-lines-in-region ()
  "Join this line or the lines in the selected region."
  (interactive)
  (cond ((region-active-p)
         (let ((min (line-number-at-pos (region-beginning))))
           (goto-char (region-end))
           (while (> (line-number-at-pos) min)
             (join-line))))
        (t (call-interactively 'join-line))))

(global-set-key (kbd "M-J") 'join-line-or-lines-in-region)

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(defun add-to-load-path (path)
  "Add PATH to your load-path."
  (interactive (list (read-directory-name "Directory: " default-directory
                                          nil  t default-directory)))
  (add-to-list 'load-path path))

;;; init-utils-el ends here
