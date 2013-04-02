;;: init-git.el

(el-get 'sync '(magit
                git-modes
                git-gutter-fringe))

(autoload 'magit-status "magit" nil t)
(global-set-key (kbd "M-<f12>") 'magit-status)

;; (setq magit-repo-dirs `())
(setq magit-commit-signoff nil)
(setq magit-completing-read-function 'magit-ido-completing-read)
(setq magit-save-some-buffers nil)
(setq magit-remote-ref-format 'remote-slash-branch)

(setq magit-diff-refine-hunk t)

;;; rebase mode
(autoload 'rebase-mode "rebase-mode" nil t)

;;; http://whattheemacsd.com/setup-magit.el-02.html
(defun magit-toggle-whitespace ()
  (interactive)
  (if (member "-w" magit-diff-options)
      (magit-dont-ignore-whitespace)
    (magit-ignore-whitespace)))

(defun magit-ignore-whitespace ()
  (interactive)
  (add-to-list 'magit-diff-options "-w")
  (magit-refresh))

(defun magit-dont-ignore-whitespace ()
  (interactive)
  (setq magit-diff-options (remove "-w" magit-diff-options))
  (magit-refresh))

(eval-after-load "magit"
  '(define-key magit-status-mode-map (kbd "W") 'magit-toggle-whitespace))

;;; git gutter.
(require 'git-gutter-fringe)

;; If you enable global minor mode
(global-git-gutter-mode t)

;; (global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
;; (setq git-gutter:diff-option "-w")

;; Jump to next/previous diff
(global-set-key (kbd "C-x p") 'git-gutter:previous-diff)
(global-set-key (kbd "C-x n") 'git-gutter:next-diff)

(setq git-gutter-fr:side 'right-fringe)


;;; Mercurial

(when (executable-find "hg")
  (el-get 'sync 'monky)
  (setq monky-process-type 'cmdserver))


;;; init-git.el ends here
