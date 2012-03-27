;;; init-grads.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. www.yagnesh.org
;; License: GPL v3 or later

(el-get 'sync '(emacs-grads))

(autoload 'gs-mode "gs-mode" nil t)
(autoload 'ctl-mode "ctl-mode" nil t)

(add-to-list 'auto-mode-alist '("\\.gs$" . gs-mode))
(add-to-list 'auto-mode-alist '("\\.ctl$" . ctl-mode))

;;; init-grads.el ends here
