;; -----------------------------------------------------------------------------
;; Custom Bindings
;; -----------------------------------------------------------------------------

(global-set-key (kbd "M-SPC") 'set-mark-command) ; was just-one-space
;; (global-set-key (kbd "M-a") execute-extended-command) ; was backward-sentence


;;; C-M \ (indent) ;; M-; (comment & uncomment-region)
(global-set-key (kbd "C-c s") 'ispell-word)

;;; scrollers
;; (global-set-key "\M-n" "\C-u1\C-v")
;; (global-set-key "\M-p" "\C-u1\M-v")

;; emacs newlines and indents when enter key
(global-set-key (kbd "C-m") 'newline-and-indent)

(global-set-key (kbd "<f9> c") 'calendar)
(global-set-key (kbd "<f9> s") 'yag/switch-to-scratch)
(global-set-key (kbd "<f9> S") 'ielm)
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
(global-set-key (kbd "C-x f") 'ffap)
(global-set-key (kbd "C-x C-p") 'find-file-at-point)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") (lambda ()
                                (interactive)
                                (revert-buffer t t t)
                                (message "buffer is reverted")))

(global-set-key (kbd "M-`") 'file-cache-minibuffer-complete)

;; (global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-h a") 'apropos) ;
;; (global-unset-key "\C-x\C-c")           ;unset kill Emacs

(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

(define-key global-map "\C-x\C-r" 'rgrep)
(define-key global-map (kbd "C-|") (lambda ()
                                     (interactive)
                                     (just-one-space -1)))

;;; unset C-z first
(global-unset-key "\C-z")

;; C-z TAB cycles through buffers
(define-key global-map [(control ?z) tab] 'bury-buffer)

;;(define-key global-map [(control tab)] 'bury-buffer)
