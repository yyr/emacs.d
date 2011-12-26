;;; init-scheme.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-scheme.el
;; Created: Monday, December 26 2011
;; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>

;;; Description:
;; mit/scheme setup

;(setq scheme-program-name "")
(require 'xscheme)

(add-to-list 'auto-mode-alist '("\\.scm$" . scheme-mode))

(dolist (hook '(scheme-mode-hook))
  (add-hook hook 'pretty-lambdas)
  (add-hook hook 'enable-paredit-mode))


;;; init-scheme.el ends here
