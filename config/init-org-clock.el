;; -----------------------------------------------------------------------------
;; Clocking 
;; -----------------------------------------------------------------------------

(defun bh/clock-in-to-next (kw)
  "Switch task from TODO to NEXT when clocking in.
Skips capture tasks and tasks with subtasks"
  (if (and (string-equal kw "TODO")
           (not (and (boundp 'org-capture-mode) org-capture-mode)))
      (let ((subtree-end (save-excursion (org-end-of-subtree t)))
            (has-subtask nil))
        (save-excursion
          (forward-line 1)
          (while (and (not has-subtask)
                      (< (point) subtree-end)
                      (re-search-forward "^\*+ " subtree-end t))
            (when (member (org-get-todo-state) org-not-done-keywords)
              (setq has-subtask t))))
        (when (not has-subtask)
          "NEXT"))))

;; Remove empty CLOCK drawers on clock out
(defun bh/remove-empty-drawer-on-clock-out ()
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at "CLOCK" (point))))

(add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)

;; Rounding minutes
(setq org-time-stamp-rounding-minutes (quote (1 15)))

;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)



(provide 'init-org-clock)
