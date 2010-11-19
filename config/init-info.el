;; -----------------------------------------------------------------------------
;; INFO DIR
;; -----------------------------------------------------------------------------

;; (setq Info-default-directory-list
;; ;      (append '("usr/share/info/" "/usr/share/info/emacs23")
;;       (append Info-default-directory-list
;;  	      '("~/git/info")))

(add-hook 'Info-mode-hook		; After Info-mode has started
	  (lambda ()
    	    (setq Info-additional-directory-list Info-default-directory-list)
	    ))

(provide 'init-info)
