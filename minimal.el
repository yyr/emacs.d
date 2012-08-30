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
(add-to-list load-path
             (cons (expand-file-name (concat el-get-install-dir
                                             "/el-get")) load-path))

;;; package to debug
(setq *debug-org* nil)
(setq *debug-o-blog* nil)
(setq *debug-ncl* nil)

;;;------------------------------------------------------------------
;;;  org
(defun minimal-load-org ()
  (setq org-install-dir (concat el-get-install-dir "/org-mode"))
  (add-to-list 'load-path (concat org-install-dir "/contrib/lisp"))
  (add-to-list 'load-path (concat org-install-dir "/lisp"))
  (require 'org-install))

(when *debug-org*
  (minimal-load-org)

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
  (minimal-load-o-blog)

  )

;;;------------------------------------------------------------------
;; NCL
(defun minimal-load-ncl ()
  (setq ncl-install-dir (concat el-get-install-dir "/ncl-mode"))
  (add-to-list 'load-path ncl-install-dir)
  (el-get 'sync 'ncl-mode)
  (load-file (expand-file-name
              (concat ncl-install-dir "/ncl-mode-load.el"))))


(when *debug-ncl*
  (minimal-load-ncl)



  )

;;; minimal.el ends here
