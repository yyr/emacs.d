;;; init-ncl.el
;;

;; load ncl using ncl.
(el-get 'sync '(ncl))

;;; Common
(autoload 'ncl-mode "ncl" "ncl-mode for editing ncar graphics" t)
(setq auto-mode-alist (cons '("\.ncl$" . ncl-mode) auto-mode-alist))
(setq ncl-startup-message nil)

;;; load ncl-doc
(add-hook 'ncl-mode-hook
          (lambda ()
            (require 'ncl-doc)
            (ncl-doc-minor-mode 1)))

;; use downloaded documentation instead (for offline use)
;; (setq ncl-doc-url-base (directory-file-name "file:///home/yagnesh/docs/ncl"))

;; auto-completion setup
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/el-get/ncl/dict")

;; yasnippet setup
(setq yas/snippet-dirs
      (append yas/snippet-dirs '("~/.emacs.d/el-get/ncl/snippets/")))


;; utility functions
(defun ncl-del-comment-indentation ()
  "remove line beginning comment indentation"
  (interactive "r")
  (save-excursion
    (goto-char (point-min))
    (replace-regexp "^[ \t]*;*" ";")))

;;; init-ncl.el ends here
