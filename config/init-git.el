;; -----------------------------------------------------------------------------
;; Git (magit)
;; -----------------------------------------------------------------------------

(require 'magit) 
(autoload 'magit-status "magit" nil t)

(global-set-key (kbd "M-<f12>") 'magit-status)
(eval-after-load 'magit-mode
  '(progn
     (define-key (kbd "<f7> p") 'magit-push)
     (define-key (kbd "<f7> l") 'magit-pull)
     ))


(require 'rebase-mode)

(provide 'init-git)
