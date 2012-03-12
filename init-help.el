;;; init-help.el
;;
;; Copyright (C) Yagnesh Raghava Yakkala. http://yagnesh.org
;;    File: init-help.el
;; Created: Friday, September 16 2011
;; License: GPL v3 or later. <http://www.gnu.org/licenses/gpl.html>


;;; Description:
;; Emacs help related settings

;;; help-map additional keys
;;; jump to source of `key`
(define-key help-map (kbd "C-k") 'find-function-on-key)
(define-key help-map (kbd "C-f") 'find-function-at-point)
(define-key help-map (kbd "C-v") 'find-variable-at-point)

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


;;; http://stackoverflow.com/a/9620373/399964
(defun locate-feature (feature)
  "Return file name as string where `feature' was provided"
  (interactive "Sfeature: ")
  (dolist (file-info load-history)
    (mapc (lambda (element)
            (when (and (consp element)
                       (eq (car element) 'provide)
                       (eq (cdr element) feature))
              (when (called-interactively-p 'any)
                (message "%s defined in %s" feature (car file-info)))
              (return (car file-info))))
          (cdr file-info))))

(defun locate-function (func)
  "Return file-name as string where `func' was defined or will be autoloaded"
  (interactive "Ccommand: ")
  (let ((res (find-lisp-object-file-name func (symbol-function func))))
    (when (called-interactively-p 'any)
      (message "%s defined in %s" func res))
    res))

;;; init-help.el ends here
