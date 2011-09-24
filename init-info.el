;;; init-info.el
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;; Author: Yagnesh Raghava Yakkala <yagnesh@NOSPAM.live.com>
;; License: GPL v3 or later

;;; Commentary:
;; info , searching docs, short cuts

;;; FIXME
(add-hook 'Info-mode-hook       ; After Info-mode has started
          (lambda ()
            (setq Info-additional-directory-list Info-default-directory-list)))

;;; http://www.masteringemacs.org/articles/2011/08/04/full-text-searching-info-mode-apropos/
;; Custom 'apropos' key bindings
(global-set-key (kbd "C-h C-a") 'Apropos-Prefix)
(define-prefix-command 'Apropos-Prefix nil "Apropos (a,d,f,i,l,v,C-v)")
(define-key Apropos-Prefix (kbd "a")   'apropos)
(define-key Apropos-Prefix (kbd "C-a") 'apropos)
(define-key Apropos-Prefix (kbd "d")   'apropos-documentation)
(define-key Apropos-Prefix (kbd "f")   'apropos-command)
(define-key Apropos-Prefix (kbd "c")   'apropos-command)
(define-key Apropos-Prefix (kbd "i")   'info-apropos)
(define-key Apropos-Prefix (kbd "l")   'apropos-library)
(define-key Apropos-Prefix (kbd "v")   'apropos-variable)
(define-key Apropos-Prefix (kbd "C-v") 'apropos-value)

(provide 'init-info)
;;; init-info.el ends here
