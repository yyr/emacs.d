;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
;(setq next-line-add-newlines nil)

;;save everything to a folder
(setq
backup-by-copying t ; don't clobber symlinks
backup-directory-alist
'(("." . "~/.emacs.d/auto-save-list")) ; don't litter my fs tree
delete-old-versions t
kept-new-versionhs 6
kept-old-versions 2
version-control t) ; use versioned backups


(setq x-select-enable-clipboard nil); Ubuntu
;;
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

; (setq ispell-command "")
(setq text-mode-hook '(lambda ()
			(local-set-key "\M-\t" 'ispell-complete-word)))
(setq tex-mode-hook '(lambda ()
		       (local-set-key "\M-\t" 'ispell-complete-word)))
(setq latex-mode-hook '(lambda ()
			 (local-set-key "\M-\t" 'ispell-complete-word)))
(setq html-helper-mode-hook '(lambda ()
			       (local-set-key "\M-\t" 'ispell-complete-word)))
(setq ispell-enable-tex-parser t)

;; How do I stop Emacs from automatically editing my startup file?
(setq disabled-command-function nil)
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(defalias 'yes-or-no-p 'y-or-n-p)

;; -----------------------------------------------------------------------------
;; Custom Bindings
;; -----------------------------------------------------------------------------

(global-set-key (kbd "C-c i") 'indent-region)
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-c s") 'ispell-word)
;;(global-set-key (kbd "C-<f4>") '(kill-buffer (current-buffer t)))

;; use funcion keys 
(global-set-key [f2] 'split-window-horizontally)
(global-set-key (kbd "<S-f2>") 'delete-other-windows)
(global-set-key (kbd "<f8>") 'other-window)

;; bs instead of buffer-menu
(global-set-key (kbd "C-x C-b") 'bs-show)
(global-set-key (kbd "C-c M-a") 'yas/reload-all)
;; emacs newlines and indents when enter key
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-c C-o") 'scroll-other-window)
(global-set-key (kbd "C-c M-f") 'load-file)
(global-unset-key (kbd "C-z"))

(defun change-to-other-buffer ()
 "Change to other buffer"
  (interactive)
 (switch-to-buffer (other-buffer (current-buffer) t)))
(global-set-key (kbd "<f1>") 'change-to-other-buffer)

;; C-k at beginning of line takes the whole line (no need to c-k twice)
(setq kill-whole-line t)
;;
(setq shell-file-name "bash") ;;use bash for shell

;; -----------------------------------------------------------------------------
;; DEFUNS
;; -----------------------------------------------------------------------------

;; date insert with arg
(defun insert-date (arg)
  "Insert date at point.
With prefix argument, insert date and time."
  (interactive "P")
  (insert (format-time-string "%Y-%m-%d"))
  (when arg
    (insert (format-time-string " %H:%M"))))
;; (global-set-key (kbd "C-c d") 'insert-date)

(defun highlight-fixme ()
  (font-lock-add-keywords nil'(("\\<\\(FIXME!?\\)"
				1 font-lock-warning-face prepend))))

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

;; from emacswiki
(defun my-delete-leading-whitespace (start end)
  "Delete whitespace at the beginning of each line in region."
  (interactive "*r")
  (save-excursion
    (if (not (bolp)) (forward-line 1))
    (delete-whitespace-rectangle (point) end nil)))

