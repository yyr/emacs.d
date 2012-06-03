;;; minimal.el
;;
;;; Description:
;; minimal setup; to report any bugs come across

;;; call emacs like this
;; emacs -Q -l ~/.emacs.d/minimal.el

;;; bug report
(setq user-full-name "Yagnesh Raghava Yakkala")
(setq user-mail-address "hi@yagnesh.org")

(setq debug-on-error t)


;;; some convenience
(defalias 'yes-or-no-p 'y-or-n-p)
(when (boundp 'ido-mode)
  (ido-mode 1))

;;; package dirs
(setq el-get-install-dir "~/.emacs.d/el-get")

;;; package to debug
(setq *debug-org* nil)
(setq *debug-o-blog* nil)


;;;------------------------------------------------------------------
;;;  org
(setq org-install-dir "~/.emacs.d/el-get/org-mode")

(defun minimal-load-org ()
  (add-to-list 'load-path (concat org-install-dir "/contrib/lisp"))
  (add-to-list 'load-path (concat org-install-dir "/lisp"))
  (require 'org-install))

(when *debug-org*
  ;; load org first
  (minimal-load-org)

  ;; reproduce bug here

  )


;;;------------------------------------------------------------------
;;;  o-blog
(defun minimal-load-o-blog ()
  (minimal-load-org)
  (add-to-list 'load-path (concat el-get-install-dir "/o-blog"))
  (require 'o-blog)
  (require 'o-blog-bootstrap)
  )


(when *debug-o-blog*
  ;; load first
  (minimal-load-o-blog)

  )




;;; minimal.el ends here
