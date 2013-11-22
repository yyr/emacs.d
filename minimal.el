;;; minimal.el
;;
;;; Description:
;; minimal setup; to report any bugs come across

;;; Call emacs as following (or see minimal.sh)
;; emacs -Q -l ~/.emacs.d/minimal.el "(minimal-load-XXX)"

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
(add-to-list 'load-path
             (expand-file-name (concat el-get-install-dir
                                       "/el-get")))
;;;  org
(defun minimal-load-org ()
  (setq org-install-dir (concat el-get-install-dir "/org-mode"))
  (add-to-list 'load-path (concat org-install-dir "/lisp"))
  (add-to-list 'load-path (concat org-install-dir "/contrib/lisp"))
  (require 'org))

;;;  o-blog
(defun minimal-load-o-blog ()
  (minimal-load-org)
  (add-to-list 'load-path (concat el-get-install-dir "/o-blog"))
  (require 'o-blog)
  (require 'o-blog-bootstrap))

;; ncl
(defun minimal-load-ncl ()
  (setq ncl-install-dir (concat el-get-install-dir "/ncl-mode"))
  (add-to-list 'load-path ncl-install-dir)
  (load-file (expand-file-name
              (concat ncl-install-dir "/ncl-mode-load.el"))))

;;; magit
(defun minimal-load-magit ()
  (setq magit-install-dir (concat el-get-install-dir "/magit"))
  (add-to-list 'load-path magit-install-dir)
  (add-to-list 'load-path (concat el-get-install-dir "/git-modes"))
  (require 'magit-autoloads))


;; el-get
(defun minimal-load-el-get ()
  (setq magit-install-dir (concat el-get-install-dir "/el-get"))
  (add-to-list 'load-path el-get-install-dir)
  (require 'el-get))


(defun minimal-load-geiser ()
  (setq magit-install-dir (concat el-get-install-dir "/geiser/elisp"))
  (add-to-list 'load-path magit-install-dir)
  (require 'geiser-load))

;;; minimal.el ends here
