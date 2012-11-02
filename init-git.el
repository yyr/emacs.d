;;: init-git.el
;;
;; Author: Yagnesh Raghava Yakkala.
;; website: http://yagnesh.org

;;; load magit
(el-get 'sync '(magit
                git-modes))

;;; setup
(autoload 'magit-status "magit" nil t)
(global-set-key (kbd "M-<f12>") 'magit-status)

;;; rebase mode
(autoload 'rebase-mode "rebase-mode" nil t)

;;; init-git.el ends here
