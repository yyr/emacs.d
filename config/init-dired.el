;; -----------------------------------------------------------------------------
;; Dired Mode
;; -----------------------------------------------------------------------------

(require 'dired+)
(setq dired-recursive-deletes 'top)
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

(provide 'init-dired)
