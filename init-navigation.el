;;; init-navigation.el
;;
;;    File: init-navigation.el
;; Created: Tuesday, December 13 2011

;;; Description:
;; navigation with in buffer related setup

(require 'ace-jump-mode)
(define-key global-map
  (kbd "M-l") 'ace-jump-mode)


;;; faster C-n C-p
(global-set-key (kbd "C-S-n") (kbd "C-6 C-n"))
(global-set-key (kbd "C-S-p") (kbd "C-6 C-p"))

;;; init-navigation.el ends here
