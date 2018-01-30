;;; init-flycheck.el
(el-get 'sync 'flycheck)
(add-hook 'prog-mode-hook 'flycheck-mode)
;; (dolist (hook '(emacs-lisp-mode-hook
;;                 c-mode-hook
;;                 python-mode-hook
;;                 sh-mode-hook))
;;   (add-hook hook 'flycheck-mode))
;; (add-hook 'latex-mode 'flycheck-mode)

(global-unset-key (kbd "M-o"))         ; stupid prefix I never used in my life.
(setq flycheck-keymap-prefix [(meta ?o)])

(after 'flycheck
  (define-key flycheck-mode-map flycheck-keymap-prefix nil)
  (define-key flycheck-mode-map flycheck-keymap-prefix
    flycheck-command-map)
  (setq flycheck-idle-change-delay 10)
  ;; Highlight whole line with error
  (setq flycheck-highlighting-mode 'columns)
  (setq flycheck-check-syntax-automatically
        ;; '(save idle-change new-line mode-enabled)
        (delq 'new-line flycheck-check-syntax-automatically)))


;; elisp
(setq-default flycheck-emacs-lisp-load-path load-path)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

;;; python
;; (setq-default flycheck-disabled-checkers (append '(python-pylint)
;;                                                  flycheck-disabled-checkers))

;;; init-flycheck.el ends here
