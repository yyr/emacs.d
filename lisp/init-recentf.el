(recentf-mode 1)
(setq recentf-max-saved-items 1024)
(setq recentf-max-menu-items 60)
(setq recentf-auto-cleanup 'never)

(setq recentf-keep '(file-remote-p file-readable-p))
(setq recentf-exclude
      '("\\.elc$" ".recentf$"))

(defun ido-choose-from-recentf (arg)
  "Use ido to select a recently opened file from the `recentf-list'"
  (interactive "P")
  (if arg
      (find-file-other-window (ido-completing-read "Open file: " recentf-list nil t))
    (find-file (ido-completing-read "Open file: " recentf-list nil t))))

(global-set-key [(meta f11)] 'ido-choose-from-recentf)
(global-set-key (kbd "M-S-<f11>")
                (lambda () (interactive) (ido-choose-from-recentf 4)))

;; (global-set-key (kbd "M-S-<f11>") 'recentf-open-files)
