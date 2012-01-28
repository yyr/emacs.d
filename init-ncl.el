;;; init-ncl.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;

;;; http://www.ncl.ucar.edu/Applications/editor.shtml
;; this line associates ncl-mode with the lisp package that defines it.

(autoload 'ncl-mode "ncl" "ncl-mode for editing ncar graphics" t)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/el-get/ncl/dict")

;;; append to the last
(setq yas/snippet-dirs
      (append yas/snippet-dirs '("~/.emacs.d/el-get/ncl/snippets/")))

(setq auto-mode-alist (cons '("\.ncl$" . ncl-mode) auto-mode-alist))
(setq ncl-startup-message nil)

;;; (add-hook 'ncl-mode-hook 'ncl-doc)

;;; imenu support for ncl-mode
(add-hook 'ncl-mode-hook
          (lambda ()
            (require 'ncl-doc)
            (ncl-doc-minor-mode 1)
            (make-local-variable browse-url-browser-function)
            (setq browse-url-browser-function 'w3m)
            ))

(setq ncl-doc-url-base "http://www.ncl.ucar.edu")
;(setq ncl-doc-url-base (directory-file-name "file:///home/yagnesh/docs/ncl"))


(defun ncl-del-comment-indentation ()
  "remove line beginning comment indentation"
  (interactive "r")
  (save-excursion
    (goto-char (point-min))
    (replace-regexp "^[ \t]*;*" ";")))

;;; init-ncl.el ends here
