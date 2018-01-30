;;; init-org.el --
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org

;; (el-get 'sync 'org-mode)

;;; load org
(add-to-list 'auto-mode-alist
             '("\\.\\(org_archive\\)$" . org-mode))

;; (require 'ox-beamer)
;; (require 'org-indent)

;;; modules
(add-hook 'org-mode-hook
          (lambda ()
            (org-indent-mode 1)
            (setq org-modules (cl-remove-duplicates
                               (append
                                '(org-special-blocks
                                  org-element
                                  org-export
                                  org-inlinetask
                                  ;; add more modules if needed
                                  )
                                org-modules)))))


;;;  Standard key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;;  Custom Key Bindings
(global-set-key (kbd "<f10>") 'org-agenda)
;; (define-key org-mode-map (kbd "C-c C-e") 'org-export-dispatch)

;;; save org-buffers every hour
;; (run-at-time "00:59" 3600 'org-save-all-org-buffers)

;;; init-org.el ends here
