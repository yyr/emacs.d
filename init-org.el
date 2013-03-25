;;; init-org.el --
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; License: GPL v3 or later

;;; load org
(el-get 'sync '(org-mode
                calfw))

(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/el-get/org-mode/lisp"))
(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/el-get/org-mode/contrib/lisp"))

(add-to-list 'auto-mode-alist
             '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

(require 'ox-beamer)
(require 'org-indent)

;;; modules
(setq org-modules (remove-duplicates
                   (append
                    '(org-special-blocks
                      org-element
                      org-export
                      org-inlinetask
                      ;; add more modules if needed

                      )
                    org-modules)))

(add-hook 'org-mode-hook (lambda ()
                           (org-indent-mode 1)))

;;;  Standard key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;;  Custom Key Bindings
(global-set-key (kbd "<f12>") 'org-agenda)
(define-key org-mode-map (kbd "C-c C-e") 'org-export-dispatch )

;;; save org-buffers every hour
(run-at-time "00:59" 3600 'org-save-all-org-buffers)

;;; hideshow-org
(el-get 'sync 'hideshow-org)
(global-set-key "\C-ch" 'hs-org/minor-mode)

;;; init-org.el ends here
