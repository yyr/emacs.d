;;----------------------------------------------------------------------------
;; Misc config - yet to be placed in separate files
;;----------------------------------------------------------------------------

(fset 'yes-or-no-p 'y-or-n-p)
(add-hook 'find-file-hooks 'goto-address-prog-mode)
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; Menu
(global-set-key (kbd "<f10>")
		(lambda ()
		  (interactive)
		  (if (window-system)
		      (menu-bar-mode (if menu-bar-mode -1 1))
		    (menu-bar-open))))



(provide 'init-misc)
