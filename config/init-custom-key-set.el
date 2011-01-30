;; -----------------------------------------------------------------------------
;; Custom Bindings
;; -----------------------------------------------------------------------------

;;; ergoemacs xahlee.org
;; make cursor movement keys under right hand's home-row.
(global-set-key (kbd "M-j") 'next-line) ; was kill-sentence
(global-set-key (kbd "M-l") 'forward-char)  ; was downcase-word
(global-set-key (kbd "M-h") 'backward-char) ; was mark paragraph
(global-set-key (kbd "M-k") 'previous-line) ; was tab-to-tab-stop

(global-set-key (kbd "M-SPC") 'set-mark-command) ; was just-one-space
;; (global-set-key (kbd "M-a") execute-extended-command) ; was backward-sentence


;;; C-M \ (indent) ;; M-; (comment & uncomment-region)
(global-set-key (kbd "C-c s") 'ispell-word)
(global-set-key (kbd "C-<f12>") (lambda ()
			      (interactive)
			      (kill-buffer (buffer-name))))

;;; scrollers
(global-set-key "\M-n" '"\C-u1\C-v")
(global-set-key "\M-p" '"\C-u1\M-v")

;; bs instead of buffer-menu
(global-set-key (kbd "C-x C-b") 'bs-show)

;; emacs newlines and indents when enter key
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-c C-o") 'scroll-other-window)

(global-set-key (kbd "<f9> c") 'calendar)
(global-set-key (kbd "<f9> g") 'gnus)
(global-set-key (kbd "<f9> s") 'yag/switch-to-scratch)
(global-set-key (kbd "<f9> f") 'boxquote-insert-file)
(global-set-key (kbd "<f9> b") 'bbdb)
(global-set-key (kbd "<f9> r") 'boxquote-region)
(global-set-key (kbd "<f9> v") 'visible-mode)


;; (global-set-key (kbd "C-<f9>") 'previous-buffer)
;; (global-set-key (kbd "C-<f10>") 'next-buffer)

(defun change-to-other-buffer ()
  "Change to other buffer"
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) t)))
(global-set-key (kbd "<f1>") 'change-to-other-buffer)

;; C-k at beginning of line takes the whole line (no need to c-k twice)
(setq kill-whole-line t)

;;; from emacs-wiki
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
