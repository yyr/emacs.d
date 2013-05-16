;;; init-flycheck.el

(el-get 'sync 'flycheck)
(require 'flycheck)

(eval-after-load 'flycheck
  '(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))

;; (add-hook 'prog-mode-hook 'flycheck-mode)
(dolist (hook '(emacs-lisp-mode-hook
                python-mode-hook
                sh-mode-hook))
  (add-hook hook 'flycheck-mode))

(add-hook 'sh-mode-hook
          (lambda ()
            (setq flycheck-checker 'bash)))

;;; init-flycheck.el ends here
