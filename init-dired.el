;; -----------------------------------------------------------------------------
;; Dired Mode
;; -----------------------------------------------------------------------------

;;;; navigation

(el-get 'sync 'dired-details) ;; Make dired less verbose

(setq dired-recursive-deletes 'always)
(setq dired-listing-switches "-alh")

(add-hook 'dired-mode-hook
          (lambda ()
            (turn-on-gnus-dired-mode)
            ;; dired-x
            (require 'dired-x)
            (require 'dired-details)
            (require 'dired-aux)
            (setq-default dired-details-hidden-string "--- ")
            (dired-details-install)
            (dired-omit-mode 1)))

(setq dired-omit-verbose nil)

(define-key dired-mode-map [mouse-2] 'dired-find-file)

(autoload 'dired-jump "dired-x"
  "Jump to dired buffer corresponding to current buffer."
  'interactive)

(autoload 'dired-jump-other-window "dired-x"
  "Like \\[dired-jump] (`dired-jump') but in other window."
  'interactive)
(setq dired-bind-jump t)
(global-set-key "\C-x\C-j" 'dired-jump)
(global-set-key "\C-x4\C-j" 'dired-jump-other-window)


;;; from org mailing list Eric Abrahamsen
(defun dired-xdg-open-file ()
  "Opens the current file in a Dired buffer."
  (interactive)
  (xdg-open-file (dired-get-file-for-visit)))

(defun xdg-open-file (filename)
  "xdg-opens the specified file."
  (interactive "fFile to open: ")
  (let ((process-connection-type nil))
    (start-process "" nil "/usr/bin/xdg-open" filename)))

;;'e' usually does 'dired-find-file, same as RET, rebinding it here
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "e") 'dired-xdg-open-file)))


(setq image-dired-external-viewer "/usr/bin/xdg-open")

;;; http://whattheemacsd.com/setup-dired.el-02.html
(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 1))

(define-key dired-mode-map
  (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(define-key dired-mode-map
  (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)

;;; init-dired.el ends here
