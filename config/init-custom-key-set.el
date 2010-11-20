;; -----------------------------------------------------------------------------
;; Custom Bindings
;; -----------------------------------------------------------------------------

(global-set-key (kbd "C-c i") 'indent-region)
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-c s") 'ispell-word)
(global-set-key (kbd "C-<f4>") (lambda ()
			      (interactive)
			      (kill-buffer (buffer-name))))

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

;; (setq ispell-command "")
(setq text-mode-hook '(lambda ()
			(local-set-key "\M-\t" 'ispell-complete-word)))
(setq tex-mode-hook '(lambda ()
		       (local-set-key "\M-\t" 'ispell-complete-word)))
(setq latex-mode-hook '(lambda ()
			 (local-set-key "\M-\t" 'ispell-complete-word)))
(setq html-helper-mode-hook '(lambda ()
			       (local-set-key "\M-\t" 'ispell-complete-word)))
(setq ispell-enable-tex-parser t)


(provide 'init-custom-key-set)
