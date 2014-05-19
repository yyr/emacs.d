;;; init-finish.el
;; Created: Wednesday, January  9 2013

(setq custom-file "~/.emacs.d/lisp/init-custom.el")
(load custom-file 'noerror)

(add-hook 'emacs-startup-hook
          '(lambda ()
             (progn
               (message "My .emacs loaded in %s"
                        (emacs-init-time))
               (el-get-notify
                "Emacs is started"
                (format "loding init file took %s"
                        (emacs-init-time)))
               (sit-for 0.5)
               ;; bit intersting startup
               (message "%s" "As always by your command... "))))

;;; init-finish.el ends here
