;;; init-flycheck.el

(el-get 'sync 'flycheck)

(after 'flycheck
       (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
       (setq flycheck-idle-change-timer 3)
       (setq flycheck-check-syntax-automatically
             (delq 'new-line flycheck-check-syntax-automatically)))

;; (add-hook 'prog-mode-hook 'flycheck-mode)
(dolist (hook '(emacs-lisp-mode-hook
                sh-mode-hook))
  (add-hook hook 'flycheck-mode))

(add-hook 'sh-mode-hook
          (lambda ()
            (setq flycheck-checker 'bash)))

;;; init-flycheck.el ends here
