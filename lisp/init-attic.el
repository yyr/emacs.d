;;; init-attic.el
;;; Description:
;; junk, unused, can be deleted setup.


(defun disable-minor-modes ()
  (interactive)
  (setq inhibit-debugger nil)
  (yas-global-mode -1)
  (recentf-mode -1)
  (hl-sexp-mode -1)
  (font-lock-mode -1)
  (mouse-wheel-mode -1)
  (line-number-mode -1)
  (shell-dirtrack-mode -1)
  (auto-composition-mode -1)
  (auto-encryption-mode -1)
  (transient-mark-mode -1)
  (winner-mode -1)
  (auto-compression-mode -1)
  (display-time-mode -1)
  (eldoc-mode -1)
  (column-number-mode -1)
  (global-font-lock-mode -1)
  (highlight-parentheses-mode -1)
  (show-paren-mode -1)
  (tooltip-mode -1)
  (diff-auto-refine-mode -1))

;;; init-attic.el ends here
