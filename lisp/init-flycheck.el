;;; init-flycheck.el

(el-get 'sync 'flycheck)

(after 'flycheck
       (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
       (setq flycheck-idle-change-delay 10)
       ;; Highlight whole line with error
       (setq flycheck-highlighting-mode 'columns)
       (setq flycheck-check-syntax-automatically
             (delq 'new-line flycheck-check-syntax-automatically)
             ;; '(save idle-change new-line mode-enabled)
             ))

;; (add-hook 'prog-mode-hook 'flycheck-mode)
(dolist (hook '(emacs-lisp-mode-hook
                c-mode-hook
                sh-mode-hook))
  (add-hook hook 'flycheck-mode))

;;; for c & cpp
(defun flycheck-show-nearby-error (arg)
  "Go forward to next error, display error. if ARG is given go to previous error"
  (interactive "P")
  (push-mark)
  (if arg
      (flycheck-previous-error)
    (flycheck-next-error))
  (let ((errors (flycheck-overlay-errors-at (point))))
    (if errors
        (flycheck-display-errors errors)
      (message "No flycheck errors at this point."))))

(global-set-key (kbd "C-?") 'flycheck-show-nearby-error)

;;; init-flycheck.el ends here
