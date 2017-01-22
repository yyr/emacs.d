;;: init-git.el
(el-get 'sync '(magit
                git-modes
                git-gutter-fringe
                projectile))

(autoload 'magit-status "magit" nil t)
(global-set-key (kbd "C-<f10>") 'magit-status)

;; (setq magit-repo-dirs `())
(setq magit-commit-signoff nil)
(setq magit-completing-read-function 'magit-ido-completing-read)
(setq magit-save-some-buffers nil)
(setq magit-remote-ref-format 'remote-slash-branch)

(setq magit-diff-refine-hunk t)

;;; rebase mode
(autoload 'rebase-mode "rebase-mode" nil t)

; (setq magit-highlight-indentation nil)
; (setq magit-highlight-trailing-whitespace nil)
; (setq magit-highlight-whitespace nil)
; (setq magit-diff-refine-hunk nil)
(setq magit-backup-untracked nil)       ; lighten magit

;;; git gutter.
;; If you enable global minor mode
(global-git-gutter-mode t)

(global-set-key (kbd "C-x C-,") 'git-gutter:toggle)
(setq git-gutter:diff-option "-w")

;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

;; Jump to next/previous diff
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

(require 'git-gutter-fringe)
(setq git-gutter-fr:side 'right-fringe)
;; (setq git-gutter:disabled-modes '(org-mode))


;;; Mercurial

(when (executable-find "hg")
  (el-get 'sync 'monky)
  (setq monky-process-type 'cmdserver))

;;; Projectile
(projectile-global-mode 1)
;; (setq projectile-enable-caching nil)
(setq projectile-indexing-method 'align)

;;; init-git.el ends here
