;;; minimal.el
;;
;;; Description:
;; minimal setup; to report any bugs come across

;;; call emacs like this
;; emacs -Q -l ~/.emacs.d/minimal.el

(setq user-full-name "Yagnesh Raghava Yakkala")

;;; some convenience
(defalias 'yes-or-no-p 'y-or-n-p)
(when (boundp 'ido-mode)
  (ido-mode))

;;; debugging package
(setq *debug-org* nil)


;;; org
(when *debug-org*
  ;; load org first
  (add-to-list 'load-path "~/.emacs.d/el-get/org-mode/lisp")
  (require 'org-install)

  ;; do stuff here

  )


;;; minimal.el ends here
