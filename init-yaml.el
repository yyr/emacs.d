;;; init-yaml.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;

(el-get 'sync 'yaml)

(autoload 'yaml-mode "yaml-mode.el" nil t)
(add-to-list 'auto-mode-alist '("\\.\\(yml\\|yaml\\)$" . yaml-mode))

;;; init-yaml.el ends here
