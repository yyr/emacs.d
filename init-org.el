;;; init-org.el --
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
;; License: GPL v3 or later


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
            (org-indent-mode 1)
            (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
            (define-key yas/keymap [tab] 'yas/next-field)
;            (autopair-mode -1)
            ))

;; (if (symbolp 'electric-pair-mode)
;;     (progn
;;       (setq autopair-dont-activate t)
;;       (autopair-mode -1)
;;       (electric-pair-mode)))

;;;  Standard key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;;  Custom Key Bindings
(global-set-key (kbd "<f12>") 'org-agenda)

(setq org-special-ctrl-a/e t)
(setq org-completion-use-ido t)
(setq font-lock-verbose nil)

;;; activate speed commands
(setq org-use-speed-commands t)

;;; disable priorities
(setq org-enable-priority-commands nil)

;;; save org-buffers every hour
(run-at-time "00:59" 3600 'org-save-all-org-buffers)

;;; init-org.el ends here
