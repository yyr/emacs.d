;;; init-auto-save.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@live.com>
;;

(setq auto-save-interval 200)
(setq auto-save-timeout 40)
;; (setq auto-save-visited-file-name t)

;;save everything to a folder
(setq
 backup-by-copying t ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs.d/saveauto")) ; don't litter my fs tree
 delete-old-versions t
 kept-new-versionhs 6
 kept-old-versions 2
 version-control t) ; use versioned backups

(provide 'init-auto-save)

;;; init-auto-save.el ends here
