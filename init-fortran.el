;; -------------------
;; common
;; -------------------

;;author heading
(defun p-header ()
  (interactive)
  (insert (format "#---------------------------------------------------------------------------
# Author: %s  Email: %s
# DATE:
# Purpose:
#
#
# Current Version: 0.1
# Latest change by on
#---------------------------------------------------------------------------
"(user-full-name)
(message user-mail-address))))

(global-set-key (kbd "C-c M-h") 'p-header)

;; -----------------------------------------------------------------------------
;; fortran mode
;; -----------------------------------------------------------------------------

(add-to-list 'auto-mode-alist
             '("\\.[fF]\\(03\\|95\\)\\'" . f90-mode))
;;(defalias 'fortran-mode 'f90-mode)

(defun f-new-line ()
  (interactive)
  (insert "PRINT*, ' '"))

(defun f-i-none ()
  (interactive)
  (insert "IMPLICIT NONE"))

(defun f-i-in ()
  (interactive)
  (insert "INTENT(in)"))

(defun f-i-out ()
  (interactive)
  (insert "INTENT(out)"))

(defun f-d-1 ()
  (interactive)
  (insert "DIMENSION(:)"))

(defun f-d-2 ()
  (interactive)
  (insert "DIMENSION(:,:)"))

(defun f-d-3 ()
  (interactive)
  (insert "DIMENSION(:,:,:)"))

(defun f-d-4 ()
  (interactive)
  (insert "DIMENSION(:,:,:,:)"))

(defun f-int ()
  (interactive)
  (insert "INTEGER(I4B)"))

(defun f-real-d ()
  (interactive)
  (insert "REAL(DP)"))

(defun f-real-s ()
  (interactive)
  (insert "REAL(SP)"))

(defun f-opt ()
  (interactive)
  (insert "OPTIONAL"))

(defun f-alloc ()
  (interactive)
  (insert "ALLOCATABLE"))

(add-hook 'f90-mode-hook
          '(lambda ()
             (define-key f90-mode-map"\C-c\M-p" 'f-new-line)
             (define-key f90-mode-map"\C-c\M-m" 'f-i-none)
             (define-key f90-mode-map"\C-c\M-i" 'f-i-in)
             (define-key f90-mode-map"\C-c\M-o" 'f-i-out)
             (define-key f90-mode-map"\C-c\M-1" 'f-d-1)
             (define-key f90-mode-map"\C-c\M-2" 'f-d-2)
             (define-key f90-mode-map"\C-c\M-3" 'f-d-3)
             (define-key f90-mode-map"\C-c\M-4" 'f-d-4)
             (define-key f90-mode-map"\C-c\M-n" 'f-int)
             (define-key f90-mode-map"\C-c\M-d" 'f-real-d)
             (define-key f90-mode-map"\C-c\M-s" 'f-real-s)
             (define-key f90-mode-map"\C-c\M-o" 'f-opt)
             (define-key f90-mode-map"\C-c\M-a" 'f-alloc)
             ;; (f90-abbrev-start)
             ;; (compile-bookmarks-mode)
             ))

(add-hook 'fortran-mode-hook
          '(lambda ()
             (define-key fortran-mode-map"\C-c\M-p" 'f-new-line)
             (define-key fortran-mode-map"\C-c\M-m" 'f-i-none)
             (define-key fortran-mode-map"\C-c\M-i" 'f-i-in)
             (define-key fortran-mode-map"\C-c\M-o" 'f-i-out)
             (define-key fortran-mode-map"\C-c\M-1" 'f-d-1)
             (define-key fortran-mode-map"\C-c\M-2" 'f-d-2)
             (define-key fortran-mode-map"\C-c\M-3" 'f-d-3)
             (define-key fortran-mode-map"\C-c\M-4" 'f-d-4)
             (define-key fortran-mode-map"\C-c\M-n" 'f-int)
             (define-key fortran-mode-map"\C-c\M-d" 'f-real-d)
             (define-key fortran-mode-map"\C-c\M-s" 'f-real-s)
             (define-key fortran-mode-map"\C-c\M-o" 'f-opt)
             (define-key fortran-mode-map"\C-c\M-a" 'f-alloc)
             ))
