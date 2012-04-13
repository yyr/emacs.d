;; -----------------------------------------------------------------------------
;; Recent Files
;; -----------------------------------------------------------------------------

(recentf-mode 1)

(defun steve-ido-choose-from-recentf ()
  "Use ido to select a recently opened file from the `recentf-list'"
  (interactive)
  (find-file (ido-completing-read "Open file: " recentf-list nil t)))

(setq recentf-max-saved-items 500)
(setq recentf-max-menu-items 60)

(global-set-key [(meta f11)] 'steve-ido-choose-from-recentf)
(global-set-key (kbd "M-S-<f11>") 'recentf-open-files)
