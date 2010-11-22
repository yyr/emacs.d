;; -----------------------------------------------------------------------------
;; Git (magit)
;; -----------------------------------------------------------------------------

(require 'magit) 
(autoload 'magit-status "magit" nil t)

(global-set-key (kbd "M-<f12>") 'magit-status)

(require 'rebase-mode)

(provide 'init-git)
