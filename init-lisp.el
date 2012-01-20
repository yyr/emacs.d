;;; init-lisp.el
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; License: GPL v3 or later

(defun set-up-hippie-expand-for-elisp ()
  (make-variable-buffer-local 'hippie-expand-try-functions-list)
  (add-to-list 'hippie-expand-try-functions-list 'try-complete-lisp-symbol t)
  (add-to-list 'hippie-expand-try-functions-list 'try-complete-lisp-symbol-partially t))

(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'pretty-lambdas)
  (add-hook hook 'set-up-hippie-expand-for-elisp)
  (add-hook hook 'turn-on-eldoc-mode)
  (add-hook hook 'enable-paredit-mode))

(add-hook 'minibuffer-setup-hook 'conditionally-enable-paredit-mode)
(defun conditionally-enable-paredit-mode ()
  "Enable paredit-mode during eval-expression"
  (if (eq this-command 'eval-expression)
      (paredit-mode 1)))

(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-to-list 'auto-mode-alist '("\\.emacs-project$" . emacs-lisp-mode))

;;; init-lisp.el ends here
