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

;;; http://www.masteringemacs.org/articles/2011/08/04/full-text-searching-info-mode-apropos/
;; Custom 'apropos' key bindings
(global-set-key (kbd "C-h C-a") 'Apropos-Prefix)
(define-prefix-command 'Apropos-Prefix nil "Apropos (a,d,f,i,l,v,C-v,C-a)")
(define-key Apropos-Prefix (kbd "a")   'apropos)
(define-key Apropos-Prefix (kbd "C-a") 'apropos)
(define-key Apropos-Prefix (kbd "d")   'apropos-documentation)
(define-key Apropos-Prefix (kbd "f")   'apropos-command)
(define-key Apropos-Prefix (kbd "c")   'apropos-command)
(define-key Apropos-Prefix (kbd "i")   'info-apropos)
(define-key Apropos-Prefix (kbd "l")   'apropos-library)
(define-key Apropos-Prefix (kbd "v")   'apropos-variable)
(define-key Apropos-Prefix (kbd "C-v") 'apropos-value)
(define-key Apropos-Prefix (kbd "C-a")   'about-emacs)

;;; init-help.el ends here
