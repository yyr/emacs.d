;;; init-org-misc.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;; Created: Tuesday, May 17 2011

;;; org-scratch
(defun dan/switch-to-org-scratch ()
  "Switch to a temp Org buffer.
If the region is active, insert it."
  (interactive)
  (let ((contents
         (and (region-active-p)
              (buffer-substring (region-beginning)
                                (region-end)))))
    (find-file "/tmp/org-scratch.org")
    (if contents (insert contents))))


;;; just like pretty lambda (Jambunathan from org-mode list)
(font-lock-add-keywords
 'org-mode
 '(("\\[\\(X\\)\\]"
    (0 (progn (compose-region (match-beginning 1) (match-end 1) "✔") nil)))))

;;; misc settings
(setq font-lock-verbose nil             ; to speed up org
      org-special-ctrl-a/e t            ; don't go to bol
      org-completion-use-ido t
      org-use-speed-commands t          ; activate speed commands
      org-return-follows-link t         ; RET dwim on links
      org-log-into-drawer t
      org-enable-priority-commands nil  ; I dont use org priorities
      )

(setq org-speed-commands-user
      '(("s" . org-save-all-org-buffers)
        ("k" . org-kill-line)
        ("K" . org-cut-subtree)
        ("A" . (org-agenda nil "T" t))
        ("$" . org-archive-subtree)))

(el-get-bundle 'org-tree-slide)
(eval-after-load "org-tree-slide"
  `(progn
     (define-key org-tree-slide-mode-map (kbd "<left>")
       'org-tree-slide-move-previous-tree)
     (define-key org-tree-slide-mode-map (kbd "<right>")
       'org-tree-slide-move-next-tree)
     (define-key org-tree-slide-mode-map (kbd "<f11>")
       'org-tree-slide-content)
     (setq org-tree-slide-skip-outline-level 2)
     (org-tree-slide-narrowing-control-profile)
     (setq org-tree-slide-skip-done nil)))

;;; init-org-misc.el ends here
