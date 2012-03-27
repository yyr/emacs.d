;;: init-git.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; License: GPL v3 or later

;;; load magit
(el-get 'sync '(magit))

;;; setup
(autoload 'magit-status "magit" nil t)
(global-set-key (kbd "M-<f12>") 'magit-status)

;;; rebase mode
(autoload 'rebase-mode "rebase-mode" nil t)

;;; init-git.el ends here
