;;; General

;; stop welcome screen
(custom-set-variables
 '(inhibit-startup-screen t))

;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
;(setq next-line-add-newlines nil)

;;save everything to a folder 
(setq
 backup-by-copying t ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs.d/auto-save-list")) ; don't litter my fs tree
 delete-old-versions t
 kept-new-versionhs 6
 kept-old-versions 2
 version-control t) ; use versioned backups

(setq disabled-command-function nil)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'init-general)
