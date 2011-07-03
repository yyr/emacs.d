;;; org-mode


(setq load-path (cons
                 (expand-file-name "~/.emacs.d/el-get/org-mode/lisp")
                 load-path))

(setq load-path (cons
                 (expand-file-name "~/.emacs.d/el-get/org-mode/contrib/lisp/")
                 load-path))

(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

;;; Eric Schulte org list
(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
          (lambda ()
            ;; yasnippet (using the new org-cycle hooks)
            (make-variable-buffer-local 'yas/trigger-key)
            (setq yas/trigger-key [tab])
            (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
            (define-key yas/keymap [tab] 'yas/next-field)
            (flyspell-mode 1)
            ))

;;;  Standard key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cb" 'org-iswitchb)

;;;  Custom Key Bindings
(global-set-key (kbd "<f12>") 'org-agenda)

(setq org-special-ctrl-a/e t)
(setq org-completion-use-ido t)
(setq font-lock-verbose nil)

(provide 'init-org)
