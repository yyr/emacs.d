;;; init-ncl.el

(ensure-package-installed 'ncl-mode)

;; use downloaded documentation instead (for offline use)
(if (file-exists-p "/home/yagnesh/doc/ncl-doc/")
    (setq ncl-doc-url-base (directory-file-name "file:///home/yagnesh/doc/ncl_doc"))
  (setq ncl-doc-url-base "http://www.ncl.ucar.edu/"))

;; utility functions
(defun ncl-del-comment-indentation ()
  "remove line beginning comment indentation"
  (interactive "r")
  (save-excursion
    (goto-char (point-min))
    (replace-regexp "^[ \t]*;*" ";")))

;;; init-ncl.el ends here
