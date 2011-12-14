;;; init-ncl.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;;

;;; http://www.ncl.ucar.edu/Applications/editor.shtml
;; this line associates ncl-mode with the lisp package that defines it.

(autoload 'ncl-mode "ncl" "ncl-mode for editing ncar graphics" t)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/el-get/ncl/dict")

(setq auto-mode-alist (cons '("\.ncl$" . ncl-mode) auto-mode-alist))
(setq ncl-startup-message nil)

;;; (add-hook 'ncl-mode-hook 'ncl-doc)

;;; imenu support for ncl-mode
(add-hook 'ncl-mode-hook
          (lambda ()
            (require 'ncl-doc)
            (ncl-doc-minor-mode 1)))

(setq ncl-doc-url-base "http://www.ncl.ucar.edu")
;(setq ncl-doc-url-base (directory-file-name "file:///home/yagnesh/docs/ncl"))

;;; init-ncl.el ends here
