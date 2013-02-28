;; -----------------------------------------------------------------------------
;; Dired Mode
;; -----------------------------------------------------------------------------

;;;; navigation

;; (el-get 'sync '(dired-plus))
;; (require 'dired+)
;; (define-key ctl-x-map   "d" 'diredp-dired-files)
;; (define-key ctl-x-4-map "d" 'diredp-dired-files-other-window)

(setq dired-recursive-deletes 'always)
(setq dired-listing-switches "-alh")
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

(define-key dired-mode-map [mouse-2] 'dired-find-file)

;; dired-x
(add-hook 'dired-load-hook
          (function (lambda () (load "dired-x"))))

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
            (define-key dired-mode-map (kbd "e") 'dired-xdg-open-file)
            (dired-omit-mode 1)))

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

;; Make dired less verbose
(el-get 'sync 'dired-details)
(eval-after-load
    "dired"
  '(progn
     (require 'dired-details)
     (setq-default dired-details-hidden-string "--- ")
     (dired-details-install)))

;;; init-dired.el ends here
