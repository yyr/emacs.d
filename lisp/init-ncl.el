;;; init-ncl.el

(el-get 'sync '(ncl-mode))

;; use downloaded documentation instead (for offline use)
;; (setq ncl-doc-url-base (directory-file-name "file:///home/yagnesh/docs/ncl"))

;; utility functions
(defun ncl-del-comment-indentation ()
  "remove line beginning comment indentation"
  (interactive "r")
  (save-excursion
    (goto-char (point-min))
    (replace-regexp "^[ \t]*;*" ";")))

;;; init-ncl.el ends here
