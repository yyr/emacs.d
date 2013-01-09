;;: init-git.el

(el-get 'sync '(magit
                git-modes))

(autoload 'magit-status "magit" nil t)
(global-set-key (kbd "M-<f12>") 'magit-status)

;; (setq magit-repo-dirs `())
(setq magit-commit-signoff t)
(setq magit-completing-read-function 'magit-iswitchb-completing-read)
(setq magit-save-some-buffers nil)
(setq magit-remote-ref-format 'remote-slash-branch)

;;; rebase mode
(autoload 'rebase-mode "rebase-mode" nil t)

;;; init-git.el ends here
