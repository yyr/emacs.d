;;; init-scheme.el

;;; Description:
;; Scheme, guile

(ensure-package-installed 'geiser)
(setq scheme-program-name "guile")

;; (when (and (symbolp Info-default-directory-list) (file-exists-p "~/local/guile/"))
;;   (eval-after-load "info"
;;     '(add-to-list 'Info-additional-directory-list "~/local/guile/share/info/")))

(add-to-list 'auto-mode-alist '("\\.scm$" . scheme-mode))
(setq geiser-active-implementations '(guile))

(dolist (hook '(scheme-mode-hook geiser-repl-mode-hook))
  (add-hook hook 'pretty-lambdas)
  (add-hook hook 'enable-paredit-mode))

;;; init-scheme.el ends here
