;;; init-auto-save.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;;

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

;; Autosave buffer on window switch
(defadvice switch-to-buffer (before save-buffer-now activate)
  (when (and buffer-file-name
             (buffer-modified-p)) (save-buffer)))

(defadvice other-window (before other-window-now activate)
  (when (and buffer-file-name
             (buffer-modified-p)) (save-buffer)))

;;; init-auto-save.el ends here
