;;; init-helm.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;; Created: Tuesday, May 29 2012

(el-get 'sync 'helm)

(add-to-list 'load-path "~/.emacs.d/el-get/helm/")

(require 'helm-config)
(helm-mode 1)
(helm-match-plugin-mode 1)

(global-set-key (kbd "<f10>") 'helm-command-prefix)

;;; init-helm.el ends here
