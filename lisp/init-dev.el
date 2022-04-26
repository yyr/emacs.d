;;; init-dev.el

;;; Description:
;; common development related packages.

(ensure-package-installed '(multiple-cursors expand-region))

;; From active region to multiple cursors:
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c C-e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-S-c C-a") 'mc/edit-beginnings-of-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "M-a") 'mc/mark-all-like-this)

;;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;;; init-er.el ends here
