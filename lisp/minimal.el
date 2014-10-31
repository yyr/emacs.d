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
             (expand-file-name "el-get" el-get-install-dir))

;;;  org
(defun minimal-load-org ()
  (setq org-install-dir (expand-file-name  "org-mode" el-get-install-dir))
  (add-to-list 'load-path (expand-file-name
                           "lisp" org-install-dir))
  (add-to-list 'load-path (expand-file-name
                           "contrib/lisp" org-install-dir))
  (require 'org))

;; ncl
(defun minimal-load-ncl ()
  (setq ncl-install-dir (expand-file-name
                         "ncl-mode" el-get-install-dir))
  (add-to-list 'load-path ncl-install-dir)
  (load-file (expand-file-name
              "ncl-mode-load.el" ncl-install-dir)))

;;; magit
(defun minimal-load-magit ()
  (setq magit-install-dir (expand-file-name
                           "magit" el-get-install-dir))
  (add-to-list 'load-path magit-install-dir)
  (add-to-list 'load-path (expand-file-name
                           "git-modes" el-get-install-dir))
  (add-to-list 'load-path (expand-file-name
                           "dash" el-get-install-dir))
  (require 'magit-autoloads))


;; el-get
(defun minimal-load-el-get ()
  (setq magit-install-dir (expand-file-name
                           "el-get" el-get-install-dir))
  (add-to-list 'load-path el-get-install-dir)
  (require 'el-get))


(defun minimal-load-geiser ()
  (setq magit-install-dir (expand-file-name
                           "geiser/elisp" el-get-install-dir))
  (add-to-list 'load-path magit-install-dir)
  (require 'geiser-load))

;;; minimal.el ends here
