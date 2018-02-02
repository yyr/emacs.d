;;; init-company.el
;; Author: Yagnesh Raghava Yakkala. http://yagnesh.org
;; Created: Thursday, January 15 2015

(el-get  'sync 'company-mode)
(global-company-mode 1)

(setq company-minimum-prefix-length 2)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map  "\t"    'company-complete-common)
;;; init-company.el ends here
