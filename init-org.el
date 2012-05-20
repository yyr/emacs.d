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

;;; install
(require 'org-install)

(require 'org)
;;; modules
(eval-after-load "org.el"
  (setq org-modules (remove-duplicates
                     (append
                      '(org-special-blocks
                        org-element
                        org-export
                        org-inlinetask
                                        ; add more modules if needed

                        )
                      org-modules))))


;;;  Standard key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;;  Custom Key Bindings
(global-set-key (kbd "<f12>") 'org-agenda)
(define-key org-mode-map (kbd "C-c C-e") 'org-export-dispatch )

;;; Eric Schulte org list
(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
          (lambda ()
            ;; yasnippet (using the new org-cycle hooks)
            (make-variable-buffer-local 'yas/trigger-key)
            (setq yas/trigger-key [tab])
            (org-indent-mode 1)
            (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
            (define-key yas/keymap [tab] 'yas/next-field)))

;;; save org-buffers every hour
(run-at-time "00:59" 3600 'org-save-all-org-buffers)

;;; init-org.el ends here
