;;; init-help.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-help.el
;;  Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
;; Created: Friday, September 16 2011
;; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>


;;; Description:
;; Emacs help related settings

;;; help-map additional keys
;;; jump to source of `key`
(define-key help-map (kbd "C-k") 'find-function-on-key)

;;; help-mode buffer
(define-key help-mode-map (kbd "n") 'next-line)
(define-key help-mode-map (kbd "p") 'previous-line)

(provide 'init-help)
;;; init-help.el ends here
