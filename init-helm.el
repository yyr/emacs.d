;;; init-helm.el
;;
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-helm.el
;; Created: Tuesday, May 29 2012

;;; Description:
;;

(add-to-list 'load-path "~/.emacs.d/el-get/helm/")
(require 'helm-config)
(helm-mode 1)
(helm-match-plugin-mode 1)

(global-set-key (kbd "<f8>") 'helm-command-prefix)
(setq )


;;; init-helm.el ends here
