;;; init-flycheck.el
(el-get 'sync 'flycheck)
(require 'flycheck)
(add-hook 'prog-mode 'flycheck-mode)
(add-hook 'latex-mode 'flycheck-mode)

(global-unset-key (kbd "M-o"))         ; stupid prefix I never used in my life.
(define-key flycheck-mode-map flycheck-keymap-prefix nil)
(setq flycheck-keymap-prefix [(meta ?o)])
(define-key flycheck-mode-map flycheck-keymap-prefix
  flycheck-command-map)

(after 'flycheck
  (setq flycheck-idle-change-delay 10)
  ;; Highlight whole line with error
  (setq flycheck-highlighting-mode 'columns)
  (setq flycheck-check-syntax-automatically
        ;; '(save idle-change new-line mode-enabled)
        (delq 'new-line flycheck-check-syntax-automatically)))

;; (add-hook 'prog-mode-hook 'flycheck-mode)
(dolist (hook '(emacs-lisp-mode-hook
                c-mode-hook
                python-mode-hook
                sh-mode-hook))
  (add-hook hook 'flycheck-mode))

;; elisp
(setq-default flycheck-emacs-lisp-load-path load-path)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

;;; python
;; (setq-default flycheck-disabled-checkers (append '(python-pylint)
;;                                                  flycheck-disabled-checkers))


;;; init-flycheck.el ends here
