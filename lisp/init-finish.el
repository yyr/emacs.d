;;; init-finish.el
;; Created: Wednesday, January  9 2013

(setq custom-file "~/.emacs.d/lisp/init-custom.el")
(load custom-file 'noerror)

(add-hook 'emacs-startup-hook
          '(lambda ()
             (progn
               (message ".emacs loaded in %s; %s"
                        (emacs-init-time) "As always by your command... "))))

;;; init-finish.el ends here
