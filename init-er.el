;;; init-er.el
;;
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-er.el

;;; Description:
;; expand region

(el-get 'sync
        'expand-region)

(global-set-key (kbd "C-=") 'er/expand-region)


;;; init-er.el ends here
