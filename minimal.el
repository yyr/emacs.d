;;; minimal.el
;;
;;; Description:
;; minimal setup; to report any bugs come across

;;; call emacs like this
;; emacs -Q -l ~/.emacs.d/minimal.el

;;; bug report
(setq user-full-name "Yagnesh Raghava Yakkala")
(setq user-mail-address "hi@yagnesh.org")

;;; some convenience
(defalias 'yes-or-no-p 'y-or-n-p)
(when (boundp 'ido-mode)
  (ido-mode))

;;; package to debug
(setq *debug-org* nil)

;;; org
(setq org-install-dir "~/.emacs.d/el-get/org-mode")


(when *debug-org*
  ;; load org first
  (add-to-list 'load-path (concat org-install-dir "/contrib/lisp"))
  (add-to-list 'load-path (concat org-install-dir "/lisp"))
  (message "icame here" )
  (require 'org-install)
  (require 'org-export)

  ;; reproduce bug here


  )

;;; minimal.el ends here
