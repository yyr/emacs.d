;; -----------------------------------------------------------------------------
;; autopair.el
;; -----------------------------------------------------------------------------

(require 'autopair)
(autopair-global-mode 1) ;; enable autopair in all buffers 
(add-hook 'emacs-lisp-mode-hook #'(lambda ()
                                    (setq autopair-dont-activate t)))

(provide 'init-autopair)
;;; 
