;; -----------------------------------------------------------------------------
;;auto fill mode
;; -----------------------------------------------------------------------------

(add-hook 'text-mode-hook
	  '(lambda ()
	     (turn-on-auto-fill)
	     (flyspell-mode)
	     ;; (highlight-parentheses-mode)
	     ))

;; toggle with C-c q 
(global-set-key (kbd "C-c q") 'auto-fill-mode)

(provide 'init-auto-fill)
