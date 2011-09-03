;; -----------------------------------------------------------------------------
;; Custom Bindings
;; -----------------------------------------------------------------------------

;;; ergoemacs xahlee.org
;; make cursor movement keys under right hand's home-row.
;; (global-set-key (kbd "M-j") 'next-line)     ; was kill-sentence
;; (global-set-key (kbd "M-l") 'forward-char)  ; was downcase-word
;; (global-set-key (kbd "M-h") 'backward-char) ; was mark paragraph
(global-set-key (kbd "M-k") 'previous-line) ; was tab-to-tab-stop

(global-set-key (kbd "M-SPC") 'set-mark-command) ; was just-one-space
;; (global-set-key (kbd "M-a") execute-extended-command) ; was backward-sentence


;;; C-M \ (indent) ;; M-; (comment & uncomment-region)
(global-set-key (kbd "C-c s") 'ispell-word)

;;; kill current buffer
(global-set-key (kbd "C-<f12>") (lambda ()
                                  (interactive)
                                  (kill-buffer (buffer-name))))

;;; scrollers
;; (global-set-key "\M-n" '"\C-u1\C-v")
;; (global-set-key "\M-p" '"\C-u1\M-v")

;; bs instead of buffer-menu
;; (global-set-key (kbd "C-x C-b") 'bs-show)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; emacs newlines and indents when enter key
(global-set-key (kbd "C-m") 'newline-and-indent)

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

(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "C-x \\") 'align-regexp)

(global-set-key [f10] 'menu-bar-mode)

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x C-M-f") 'find-file-in-project)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-p") 'find-file-at-point)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "M-`") 'file-cache-minibuffer-complete)

(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-h a") 'apropos) ;

(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

(define-key global-map "\C-x\C-r" 'rgrep)

;;; unset C-z first
(global-unset-key "\C-z")
;; C-z t to clear trailing whitespace
(define-key global-map [(control ?z) ?t] 'delete-trailing-whitespace)
;; C-z TAB cycles through buffers
(define-key global-map [(control ?z) tab] 'bury-buffer)
;; C-TAB also cycles through buffers
(define-key global-map [(control tab)] 'bury-buffer)
;; I like XEmacs' M-g for goto-line, use it GNU too
;; (define-key global-map [(meta ?g)] 'goto-line)

(provide 'init-custom-key-set)
