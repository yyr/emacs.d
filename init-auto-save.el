;;; init-auto-save.el

(el-get 'sync 'backup-each-save)

(setq auto-save-interval 200)
(setq auto-save-timeout 40)
;; (setq auto-save-visited-file-name t)

;;save everything to a folder
(setq
 backup-by-copying t ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs.d/auto-save-list/")) ; don't litter my fs tree
 delete-old-versions t
 kept-new-versionhs 6
 kept-old-versions 2
 version-control t) ; use versioned backups

(require 'backup-each-save)

(add-hook 'after-save-hook 'backup-each-save)

(defun backup-each-save-filter (filename)
  (let ((ignored-filenames
         '("^/tmp" "semantic.cache$" "\\.emacs-places$"
           "\\.recentf$" ".newsrc\\(\\.eld\\)?"))
        (matched-ignored-filename nil))
    (mapc
     (lambda (x)
       (when (string-match x filename)
         (setq matched-ignored-filename t)))
     ignored-filenames)
    (not matched-ignored-filename)))

(setq backup-each-save-filter-function 'backup-each-save-filter)
;;; init-auto-save.el ends here
