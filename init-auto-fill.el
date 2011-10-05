;; -----------------------------------------------------------------------------
;;auto fill mode
;; -----------------------------------------------------------------------------

;; (auto-fill-mode t)                      ; Automatically wrap lines

(dolist (hook (list
               'org-mode-hook
               'text-mode-hook
               'message-mode-hook
               'LaTeX-mode-hook
               'erc-mode-hook))
  (add-hook hook 'turn-on-auto-fill))

;; toggle with C-c q 
(global-set-key (kbd "C-c q") 'auto-fill-mode)
;; C-z f toggles auto-fill
(define-key global-map [(control ?z) ?f] 'auto-fill-mode)

(provide 'init-auto-fill)