;;; init-scheme.el

;;; Description:
;; Scheme, guile

(el-get 'sync 'geiser)

(setq scheme-program-name "guile")

(require 'xscheme)
(require 'geiser-install)

(when (file-exists-p "~/local/guile/")
  (add-to-list 'Info-additional-directory-list "~/local/guile/share/info/"))

(add-to-list 'auto-mode-alist '("\\.scm$" . scheme-mode))
(setq geiser-impl-installed-implementations 'guile)


(dolist (hook '(scheme-mode-hook))
  (add-hook hook 'pretty-lambdas)
  (add-hook hook 'enable-paredit-mode))

;;; init-scheme.el ends here
