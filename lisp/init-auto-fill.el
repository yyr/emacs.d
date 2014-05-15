;; -----------------------------------------------------------------------------
;;auto fill mode
;; -----------------------------------------------------------------------------

;; (auto-fill-mode t)                      ; Automatically wrap lines

(dolist (hook (list
               'org-mode-hook
               'text-mode-hook
               'message-mode-hook
               'magit-log-mode
               'LaTeX-mode-hook
               'erc-mode-hook))
  (add-hook hook 'turn-on-auto-fill))

;; toggle with C-c q
;; C-z f toggles auto-fill
(define-key global-map [(control ?z) ?f] 'auto-fill-mode)

;;; Stefan Monnier. It is the opposite of fill-paragraph
(defun unfill-paragraph ()
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(define-key global-map "\M-Q" 'unfill-paragraph)
